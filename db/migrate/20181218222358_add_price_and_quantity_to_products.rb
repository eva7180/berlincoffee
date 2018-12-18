class AddPriceAndQuantityToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :decimal
    add_column :products, :quantity, :integer
  end
end
