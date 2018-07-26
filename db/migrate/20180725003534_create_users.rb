class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, unique: true
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.integer :role, default: 0
      t.string :order_history

      t.timestamps
    end
  end
end
