class AddExpiresAtToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :expires_at, :datetime
  end
end
