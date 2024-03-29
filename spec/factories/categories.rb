# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "カテゴリ#{n}" }
    sequence(:order_no)
  end
end
