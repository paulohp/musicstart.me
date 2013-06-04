class Project < ActiveRecord::Base
  belongs_to :users
  has_many :rewards, :dependent => :destroy
  has_many :backers, :dependent => :destroy
  has_many :backered_projects, :through => :backers, :source => :project
  accepts_nested_attributes_for :rewards, allow_destroy: true
  attr_accessible :category, :decription, :headline, :name, :price, :soundcloud_url, :user_id, :approved, :image_url, :online_day, :rewards_attributes

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

  def total_backers
    self.backers.size
  end

  def total_pleged
    self.backers.map(&:value).inject(:+).to_f
  end

  def soundcloud_player
    # create a client object with your app credentials
    client = Soundcloud.new(:client_id => '9a33dd32c2867d828bf07504a0f18545')

    # get a tracks oembed data
    track_url = 'http://soundcloud.com/forss/flickermood' #self.soundcloud_url

    embed_info = client.get('/oembed', :url => track_url)

    # print the html for the player widget
    return embed_info['html']
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
      "#{rand(1..100)}%"
    end
  end
end