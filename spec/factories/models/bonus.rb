# frozen_string_literal: true

FactoryBot.define do
  factory :bonus, class: 'CgtraderLevels::Bonus' do
    field { %w[tax coin].sample }
    modifier { 1 }
  end
end
