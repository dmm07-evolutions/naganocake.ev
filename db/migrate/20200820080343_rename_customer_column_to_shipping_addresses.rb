class RenameCustomerColumnToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
  	rename_column :shipping_addresses, :customer, :customer_id
  end
end
