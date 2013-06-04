class User < ActiveRecord::Base

  after_save :atualizar_pontos

  has_many :points
  has_many :badges , :through => :levels
  has_many :levels
  has_many :projects, :dependent => :destroy
  has_many :backers, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :nickname, :email, :password, :password_confirmation, :remember_me, :location
  # attr_accessible :title, :body
  validates_uniqueness_of :email, :nickname, case_sensitive: false

  validates :nickname, format: { with: /\A[\w-]+\Z/i, message: "must contain only numbers, letters and - , _ characters" }, length: { in: 2..20 }, presence: true, uniqueness: true

  def change_points(options)
    if Gioco::Core::TYPES
      type_id = options[:type]
      points  = options[:points]
    else
      points  = options
    end
    type      = (type_id) ? Type.find(type_id) : false

    if Gioco::Core::TYPES
      raise "Missing Type Identifier argument" if !type_id
      old_pontuation  = self.points.where(:type_id => type_id).sum(:value)
    else
      old_pontuation  = self.points.to_i
    end
    new_pontuation    = old_pontuation + points
    Gioco::Core.sync_resource_by_points(self, new_pontuation, type)
  end

  def next_badge?(type_id = false)
    type              = (type_id) ? Type.find(type_id) : false
    if Gioco::Core::TYPES
      raise "Missing Type Identifier argument" if !type_id
      old_pontuation  = self.points.where(:type_id => type_id).sum(:value)
    else
      old_pontuation  = self.points.to_i
    end
    next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
    last_badge_point = self.badges.last.try('points')
    last_badge_point ||= 0

    if next_badge
      percentage      = (old_pontuation - last_badge_point)*100/(next_badge.points - last_badge_point)
      points          = next_badge.points - old_pontuation
      next_badge_info = {
                          :badge      => next_badge,
                          :points     => points,
                          :percentage => percentage
                        }
    end
  end

  def atualizar_pontos
    user = User.find(self.id)
    type = Type.where(:name => "ajudante")
    if user.points.last == nil
      user.change_points({ points: 0, type: type.first.id })
    end
  end

end
