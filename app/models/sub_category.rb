# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :posts, dependent: :restrict_with_exception
end
