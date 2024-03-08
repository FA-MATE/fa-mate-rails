# frozen_string_literal: true

class Condition < ApplicationRecord
  belongs_to :condition_group
  has_many :user_conditions, dependent: :restrict_with_exception
  has_many :post_conditions, dependent: :restrict_with_exception
  has_many :posts, through: :post_conditions
  has_many :users, through: :user_conditions
end
