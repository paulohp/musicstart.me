class ProjectsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  # GET /tasks
  # GET /tasks.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @project = Project.find(params[:id])
    @rewards = @project.rewards
    @user = User.find(@project.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @project = current_user.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /tasks/1/edit
  def edit
    @project = current_user.projects.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = current_user.projects.build(params[:project])
    @user = current_user
    respond_to do |format|
      if @project.save
        @user.change_points({ points: 10, type: 1 })
        format.html { redirect_to @project, notice: 'Task was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @project = current_user.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end