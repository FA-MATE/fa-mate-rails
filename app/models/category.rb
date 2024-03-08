# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
  has_many :posts, dependent: :restrict_with_exception
end
