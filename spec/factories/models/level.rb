# frozen_string_literal: true

FactoryBot.define do
  factory :level, class: 'CgtraderLevels::Level' do
    title { 'First Level' }
    experience { 0 }

    trait :level2 do
      transient do
        previous_level { create :level }
      end

      title { 'Second Level' }
      experience { 10 }
      level { previous_level }
    end

    trait :level3 do
      transient do
        previous_level { create :level, :level2 }
      end

      title { 'Third Level' }
      experience { 30 }
      level { previous_level }
    end
  end
end
