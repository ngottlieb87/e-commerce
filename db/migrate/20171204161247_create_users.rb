class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.column :name, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.column :email, :string
      t.column :admin, :boolean, default: false

      t.timestamps
    end
  end
end
