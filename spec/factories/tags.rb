FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "タグ#{n}" }
    sequence(:order_no)

    trait :with_tag_group do
      before :create do |tag|
        tag.tag_group = create :tag_group
      end
    end
  end
end
