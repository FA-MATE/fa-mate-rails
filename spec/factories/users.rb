# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    sequence(:nickname) { |n| "ニックネーム#{n}" }
    profile_image_url { '' }
  end
end
