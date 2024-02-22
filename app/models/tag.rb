class Tag < ApplicationRecord
  belongs_to :tag_group
  has_many :post_tags
  has_many :posts, through: :post_tags
end
