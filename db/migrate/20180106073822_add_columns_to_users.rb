class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_column :users, :photo, :string
    add_column :users, :website, :string
    add_column :users, :linkedin, :string
    add_column :users, :twitter, :string
  end
end
