class ChangeColumnInOrders < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders, :total, :quantity
  	change_column :orders, :quantity, :integer
  end
end
