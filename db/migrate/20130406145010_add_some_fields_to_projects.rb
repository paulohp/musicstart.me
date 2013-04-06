class AddSomeFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :video_url, :string
    add_column :projects, :image_url, :string
    add_column :projects, :can_finish, :string
    add_column :projects, :finished, :boolean
    add_column :projects, :visible, :boolean
    add_column :projects, :rejected, :boolean
    add_column :projects, :successful, :boolean
    add_column :projects, :state, :string
    add_column :projects, :online_day, :integer
  end
end
