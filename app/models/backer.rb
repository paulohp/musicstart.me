class Backer < ActiveRecord::Base
  belongs_to :projects
  belongs_to :users
  belongs_to :rewards
  attr_accessible :confirmed, :project_id, :reward_id, :user_id, :value, :reward_value

  def projects
    Project.find(self.project_id)
  end
end
