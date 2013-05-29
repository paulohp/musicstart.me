class Project < ActiveRecord::Base
  belongs_to :users
  has_many :rewards
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved, :image_url, :online_day

  validates_presence_of :name, :price

  mount_uploader :image_url, ProjectPictureUploader

  def owner
    user = User.find(self.user_id)
    if user.name == ""
      return user.email
    else
      return user.name
    end
  end

  def location
    user = User.find(self.user_id)
    user.location
  end

  def description
    self.decription.to_s.slice(0..120)
  end

  def status_progress
    if successful?
      "100%"
    else
      "20%"
    end
  end
end