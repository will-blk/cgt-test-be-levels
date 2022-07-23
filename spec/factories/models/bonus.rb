FactoryBot.define do
  factory :bonus, class: CgtraderLevels::Bonus do
    field { ['tax', 'coin'].sample }
    modifier { 1 }
  end
end