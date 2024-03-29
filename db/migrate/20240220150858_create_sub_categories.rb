# frozen_string_literal: true

class CreateSubCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.integer :order_no

      t.timestamps
    end
  end
end
