FactoryBot.define do
  factory :post_condition do
    association :post
    association :condition
  end
end
