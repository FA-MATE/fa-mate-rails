# frozen_string_literal: true

FactoryBot.define do
  factory :tag_group do
    sequence(:name) { |n| "タググループ#{n}" }
    sequence(:order_no)
  end
end
