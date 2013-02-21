class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :string
    add_column :users, :bio, :text
  end
end
