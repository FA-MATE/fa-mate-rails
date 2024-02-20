class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.references :tag_group, null: false, foreign_key: true
      t.string :name
      t.integer :order_no

      t.timestamps
    end
  end
end
