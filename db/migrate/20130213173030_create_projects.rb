class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :category
      t.string :headline
      t.string :decription
      t.string :soundcloud_url
      t.integer :user_id
      t.string :price

      t.timestamps
    end
  end
end
