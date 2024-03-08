# frozen_string_literal: true

class PostCondition < ApplicationRecord
  belongs_to :post
  belongs_to :condition
end
