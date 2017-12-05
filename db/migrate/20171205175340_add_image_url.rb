class AddImageUrl < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :image_url, :string
    add_column :products, :description, :text
  end
end
