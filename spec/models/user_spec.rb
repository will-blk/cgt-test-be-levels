require 'spec_helper'

describe CgtraderLevels::User do
  describe 'new user' do
    let(:user) { CgtraderLevels::User.new }

    it 'has 0 reputation points' do
      expect(user.reputation).to eq(0)
    end

    it "has assigned 'First level'" do
      level = CgtraderLevels::Level.create!(experience: 0, title: 'First level')

      expect(user.level).to eq(level)
    end
  end

  describe 'level up' do
    let!(:level_1) { create :level }
    let!(:level_2)  { create :level, :level_2 }
    let(:user) { create :user, level: level_1 }
    
    it "level ups from 'First level' to 'Second level'" do
      expect {
        user.update_attribute(:reputation, 10)
      }.to change { user.reload.level }.from(level_1).to(level_2)
    end

    it "level ups from 'First level' to 'Second level'" do
      level_3 = create :level, experience: 13, title: 'Third level'
      
      expect {
        user.update_attribute(:reputation, 11)
      }.to change { user.reload.level }.from(level_1).to(level_2)
    end
  end

  describe 'level up bonuses & privileges' do
    let!(:level_1) { create :level }
    let!(:level_2)  { create :level, :level_2 }
    
    let(:user) { create :user, level: level_1 }
    
    it 'gives 7 coins to user' do
      coin_bonus = create :bonus, field: 'coins', modifier: 7, level: level_2
      
      user.update_attribute(:coins, 1)
      
      expect {
        user.update_attribute(:reputation, 10)
      }.to change { user.reload.coins }.from(1).to(8)
    end
    
    it 'reduces tax rate by 1' do
      tax_bonus = create :bonus, field: 'tax', modifier: -1, level: level_2

      user.update_attribute(:tax, 15)

      expect {
        user.update_attribute(:reputation, 10)
      }.to change { user.reload.tax }.from(15).to(14)
    end
  end
end
