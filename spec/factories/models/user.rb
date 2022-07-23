FactoryBot.define do
  factory :user, class: CgtraderLevels::User do
    username { 'User' }
    reputation { 0 }
    coins { 0 }
    tax { 10 }
    level
  end
end