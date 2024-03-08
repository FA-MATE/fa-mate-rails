FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "ニックネーム#{n}" }
    profile_image_url { '' }
  end
end
