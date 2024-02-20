class Condition < ApplicationRecord
  belongs_to :condition_group
  has_many :user_conditions
  has_many :post_conditions
  has_many :posts, through: :post_conditions
  has_many :users, through: :user_conditions
  
end
