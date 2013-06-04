class BackersController < InheritedResources::Base
  before_filter :authenticate_user!

  def new
    @backer = current_user.backers.build
    @project = Project.find(params[:project_id])
    @rewards = @project.rewards
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @backer = current_user.backers.build(params[:backer])

    respond_to do |format|
      if @backer.save
        format.html { redirect_to root_path, notice: 'Backer was successfully created.' }
        format.json { render json: @backer, status: :created, location: @backer }
      else
        format.html { render action: "new" }
        format.json { render json: @backer.errors, status: :unprocessable_entity }
      end
    end
  end

end
