# frozen_string_literal: true

class ConditionGroup < ApplicationRecord
  has_many :conditions, dependent: :destroy
end
