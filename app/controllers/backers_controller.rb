class BackersController < InheritedResources::Base
  before_filter :authenticate_user!

  def new
    @backer = current_user.backers.build
    @project = Project.find(params[:project_id])
    @rewards = @project.rewards
  end

end
