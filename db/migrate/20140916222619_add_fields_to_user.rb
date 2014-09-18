class AddFieldsToUser < ActiveRecord::Migration
  def change
	  add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :work, :string
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :github, :string
    add_column :users, :role_id, :integer, :default => 3

  end
end
