class AddBackerIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :backer_id, :integer
  end
end
