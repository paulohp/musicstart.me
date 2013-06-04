class Backer < ActiveRecord::Base
  belongs_to :projects
  belongs_to :users
  attr_accessible :confirmed, :project_id, :reward_id, :user_id, :value, :reward_value
end
