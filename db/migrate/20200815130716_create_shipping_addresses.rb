class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      t.integer :customer, null:false
      t.string :postcode, null:false
      t.string :address, null:false
      t.string :destination, null:false
      t.timestamps null:false
    end
  end
end
