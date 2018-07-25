class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id, index: true
      t.integer :manufacture_id, index: true
      t.string :picture
      t.string :description
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
