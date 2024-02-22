class Post < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category
  belongs_to :user
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :post_conditions
  has_many :conditions, through: :post_conditions
end
