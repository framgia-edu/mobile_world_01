class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.float :stars
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end
