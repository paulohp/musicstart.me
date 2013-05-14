class Project < ActiveRecord::Base
  belongs_to :users
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved, :image_url, :online_day

  mount_uploader :image_url, ProjectPictureUploader

  def owner
    User.find(self.user_id).name
  end

  def status_progress
    if successful?
      "100%"
    else
      "20%"
    end
  end
end