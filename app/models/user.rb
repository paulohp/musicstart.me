class User < ActiveRecord::Base
  has_many :projects, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :nickname, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  validates_uniqueness_of :email, :nickname, case_sensitive: false
  validates :nickname, format: { with: /\A[\w-]+\Z/i, message: "must contain only numbers, letters and - , _ characters" }, length: { in: 2..20 }, presence: true, uniqueness: true
end
