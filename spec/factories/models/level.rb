FactoryBot.define do
  factory :level, class: CgtraderLevels::Level do
    title { 'First Level'}
    experience { 0 }

    trait :level_2 do
      title { 'Second Level' }
      experience { 10 }
    end
  end
end