class AddVarietyToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :variety, :string
  end
end
