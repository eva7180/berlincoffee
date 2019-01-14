class UpdateOrderTable < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :quantity
  	remove_column :orders, :product_id
  	add_column :orders, :status, :string
  	add_column :orders, :total_price, :decimal
  end
end