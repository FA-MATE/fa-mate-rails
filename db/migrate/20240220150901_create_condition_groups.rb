# frozen_string_literal: true

class CreateConditionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :condition_groups do |t|
      t.string :name
      t.integer :order_no

      t.timestamps
    end
  end
end
