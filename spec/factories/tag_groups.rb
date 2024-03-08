FactoryBot.define do
  factory :tag_group do
    sequence(:name) { |n| "タググループ#{n}" }
    sequence(:order_no)
  end
end
