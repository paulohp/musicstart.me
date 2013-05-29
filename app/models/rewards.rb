class Rewards < ActiveRecord::Base
  attr_accessible :description, :maximum_backers, :minimum_value, :project_id

  belongs_to :projects
end
