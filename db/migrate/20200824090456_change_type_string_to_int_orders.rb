class ChangeTypeStringToIntOrders < ActiveRecord::Migration[5.2]
  def up
  	change_column :orders, :shipping_cost, :integer
  end

  def down
  	change_column :orders, :shipping_cost, :string
  end
end
