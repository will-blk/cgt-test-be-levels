# frozen_string_literal: true

require 'spec_helper'

describe CgtraderLevels::Models::User do
  describe '#new' do
    let(:user) { described_class.new }
    let!(:level) { create :level }

    it 'has 0 reputation points' do
      expect(user.reputation).to eq(0)
    end

    it "has assigned 'First level'" do
      expect(user.level).to eq(level)
    end
  end

  describe 'level up' do
    let!(:level1) { create :level }
    let!(:level2) { create :level, :level2, level: level1 }
    let(:user) { create :user, level: level1 }

    context 'when reputation is exactly the required for next level' do
      it "level ups from 'First level' to 'Second level'" do
        expect do
          user.update_attribute(:reputation, 10)
        end.to change { user.reload.level }.from(level1).to(level2)
      end
    end

    context 'when reputation is higher than required for one level' do
      it "level ups from 'First level' to 'Second level'" do
        create :level, experience: 13, title: 'Third level', level: level2

        expect do
          user.update_attribute(:reputation, 11)
        end.to change { user.reload.level }.from(level1).to(level2)
      end
    end

    context 'when reputation is higher than required for two levels' do
      let!(:level3) { create :level, experience: 13, title: 'Third level', level: level2 }

      it 'does not skip level' do
        expect do
          user.update_attribute(:reputation, 15)
        end.to change { user.reload.level }.from(level1).to(level2)
      end

      it 'reaches third level' do
        expect do
          user.update_attribute(:reputation, 15)
          user.update_attribute(:reputation, 15)
        end.to change { user.reload.level }.from(level1).to(level3)
      end
    end
  end

  describe 'level up bonuses & privileges' do
    let!(:level1) { create :level }
    let!(:level2) { create :level, :level2, level: level1 }

    let(:user) { create :user, level: level1 }

    context 'when level up twice' do
      let!(:level3) { create :level, :level3, level: level2 }

      before do
        create :bonus, field: 'coins', modifier: 3, level: level2
        create :bonus, field: 'coins', modifier: 5, level: level3
      end

      it 'stacks bonuses' do
        expect do
          user.update_attribute(:reputation, 10)
          user.update_attribute(:reputation, 30)
        end.to change { user.reload.coins }.from(0).to(8)
      end
    end

    it 'gives 7 coins to user' do
      create :bonus, field: 'coins', modifier: 7, level: level2

      user.update_attribute(:coins, 1)

      expect do
        user.update_attribute(:reputation, 10)
      end.to change { user.reload.coins }.from(1).to(8)
    end

    it 'reduces tax rate by 1' do
      create :bonus, field: 'tax', modifier: -1, level: level2

      user.update_attribute(:tax, 15)

      expect do
        user.update_attribute(:reputation, 10)
      end.to change { user.reload.tax }.from(15).to(14)
    end
  end
end
