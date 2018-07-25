class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.integer :user_id, index: true
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
