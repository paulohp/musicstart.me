class Project < ActiveRecord::Base
  belongs_to :users
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved, :image_url

  mount_uploader :image_url, ProjectPictureUploader
end