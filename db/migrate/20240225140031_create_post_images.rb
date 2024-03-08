# frozen_string_literal: true

class CreatePostImages < ActiveRecord::Migration[7.1]
  def change
    create_table :post_images do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :order_no

      t.timestamps
    end
  end
end
