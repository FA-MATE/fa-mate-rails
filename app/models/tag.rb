# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :tag_group
  has_many :post_tags, dependent: :restrict_with_exception
  has_many :posts, through: :post_tags
end
