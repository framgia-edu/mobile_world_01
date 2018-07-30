class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.integer :cart_id, index:true
      t.integer :user_id, index: true
      t.decimal :total_price
      t.boolean :status
      t.datetime :transaction_time
      t.string :payment_method

      t.timestamps
    end
  end
end
