class User < ApplicationRecord
  has_many :posts
  has_many :user_conditions
  has_many :conditions, through: :user_conditions
end
