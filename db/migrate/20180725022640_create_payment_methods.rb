class CreatePaymentMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_methods do |t|
      t.string :name
      t.datetime :expire_date
      t.integer :user_id

      t.timestamps
    end
  end
end
