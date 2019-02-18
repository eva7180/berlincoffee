class AddFkToOrderItems < ActiveRecord::Migration[5.2]
  def change
  	remove_column :order_items, :cart_id
  	add_reference :order_items, :cart, foreign_key: true
  end
end