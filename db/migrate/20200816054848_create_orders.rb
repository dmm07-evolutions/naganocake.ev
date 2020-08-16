class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
	 t.integer :customer_id, null: false
	 t.integer :postal_code, null: false
	 t.string :address, null: false
	 t.string :name, null: false
	 t.string :shipping_cost, null: false
	 t.integer :total_payment
	 t.integer :payment_method, null: false, default:0
	 t.integer :status, null: false, default:0
     t.timestamps
    end
  end
end
