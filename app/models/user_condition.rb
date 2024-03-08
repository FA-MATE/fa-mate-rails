# frozen_string_literal: true

class UserCondition < ApplicationRecord
  belongs_to :user
  belongs_to :condition
end
