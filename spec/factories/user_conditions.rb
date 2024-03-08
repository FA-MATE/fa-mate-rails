FactoryBot.define do
  factory :user_condition do
    association :user
    association :condition
  end
end
