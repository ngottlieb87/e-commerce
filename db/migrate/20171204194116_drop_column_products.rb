class DropColumnProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :price
    remove_column :orders, :total_price
  end
end
