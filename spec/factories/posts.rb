FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:body) { |n| "本文#{n}" }

    trait :with_user do
      before :create do |post|
        post.user = create :user
      end
    end

    trait :with_sub_category do
      before :create do |post|
        sub_category = create(:sub_category, :with_category)
        post.category = sub_category.category
        post.sub_category = sub_category
      end
    end

    trait :with_tags do
      before :create do |post|
        post.tags << create(:tag, :with_tag_group)
      end
    end

    trait :with_conditions do
      before :create do |post|
        post.conditions << create(:condition, :with_condition_group)
      end
    end

    trait :with_post_images do
      after :create do |post|
        post_image = FactoryBot.build(:post_image, post: post)
        post_image.image.attach(io: File.open("public/images/dummy/pet0.jpg"), filename: "pet0.jpg")
        post.post_images << post_image
      end
    end

    factory :post_completed, traits: [:with_user, :with_sub_category, :with_tags, :with_conditions, :with_post_images] 
  end
end
