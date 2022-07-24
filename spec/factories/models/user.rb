# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'CgtraderLevels::Models::User' do
    username { 'User' }
    reputation { 0 }
    coins { 0 }
    tax { 10 }
    level
  end
end
