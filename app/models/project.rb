class Project < ActiveRecord::Base
  belongs_to :users
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved, :image_url, :online_day

  mount_uploader :image_url, ProjectPictureUploader

  def self.status_progress
    if successful?
      "100%"
    else
      "8%"
    end
  end
end