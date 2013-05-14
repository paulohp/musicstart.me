class AddShowHomeToProject < ActiveRecord::Migration
  def change
    add_column :projects, :show_home, :boolean
  end
end
