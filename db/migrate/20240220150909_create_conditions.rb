# frozen_string_literal: true

class CreateConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :conditions do |t|
      t.references :condition_group, null: false, foreign_key: true
      t.string :name
      t.integer :order_no

      t.timestamps
    end
  end
end
