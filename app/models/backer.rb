class Backer < ActiveRecord::Base
  attr_accessible :confirmed, :project_id, :reward_id, :user_id, :value
end
