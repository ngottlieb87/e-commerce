class AddPriceColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :decimal
    add_column :orders, :total_price, :decimal

  end
end
