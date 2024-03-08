FactoryBot.define do
  factory :condition_group do
    sequence(:name) { |n| "条件グループ#{n}" }
    sequence(:order_no)
  end
end
