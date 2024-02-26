class Post < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_conditions
  has_many :conditions, through: :post_conditions
  has_many :post_images

  accepts_nested_attributes_for :post_tags, :post_conditions, :post_images
end
