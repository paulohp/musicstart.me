class CreateBackers < ActiveRecord::Migration
  def change
    create_table :backers do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :reward_id
      t.float :value
      t.boolean :confirmed

      t.timestamps
    end
  end
end
