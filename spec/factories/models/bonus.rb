# frozen_string_literal: true

FactoryBot.define do
  factory :bonus, class: 'CgtraderLevels::Models::Bonus' do
    field { %w[tax coin].sample }
    modifier { 1 }
  end
end
