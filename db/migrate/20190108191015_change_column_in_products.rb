class ChangeColumnInProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :quantity, :size
  end
end
