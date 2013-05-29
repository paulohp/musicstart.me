class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :description
      t.integer :project_id
      t.numeric :minimum_value
      t.string :maximum_backers

      t.timestamps
    end
  end
end
