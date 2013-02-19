class AddApprovedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :approved, :integer
  end
end
