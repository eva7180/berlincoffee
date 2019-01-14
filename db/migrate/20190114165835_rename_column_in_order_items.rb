class RenameColumnInOrderItems < ActiveRecord::Migration[5.2]
  def change
  	rename_column :order_items, :order_id, :cart_id
  end
end
