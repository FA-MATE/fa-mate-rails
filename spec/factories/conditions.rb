# frozen_string_literal: true

FactoryBot.define do
  factory :condition do
    sequence(:name) { |n| "条件#{n}" }
    sequence(:order_no)

    trait :with_condition_group do
      before :create do |condition|
        condition.condition_group = create :condition_group
      end
    end
  end
end
