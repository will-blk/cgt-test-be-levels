# frozen_string_literal: true

FactoryBot.define do
  factory :level, class: 'CgtraderLevels::Level' do
    title { 'First Level' }
    experience { 0 }

    trait :level2 do
      title { 'Second Level' }
      experience { 10 }
    end
  end
end
