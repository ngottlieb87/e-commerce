class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.decimal :price, precision: 5, scale: 2
      t.string :name
      t.string :image_url
      t.text :description
      t.timestamps
    end
  end
end
