# frozen_string_literal: true

FactoryBot.define do
  factory :sub_category do
    category
    sequence(:name) { |n| "品種#{n}" }
    sequence(:order_no)

    trait :with_category do
      before :create do |sub_category|
        sub_category.category = create :category
      end
    end
  end
end
