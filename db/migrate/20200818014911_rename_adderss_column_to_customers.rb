class RenameAdderssColumnToCustomers < ActiveRecord::Migration[5.2]
  def up
  	rename_column :customers, :adderss, :address
  end

  def down
  	rename_column :customers, :address, :adderss
  end

end
