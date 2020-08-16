class CreateCratItems < ActiveRecord::Migration[5.2]
  def change
    create_table :crat_items do |t|
      t.integer :customer_id
      t.integer :item_id
      t.integer :quantity
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
