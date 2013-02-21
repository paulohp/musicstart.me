class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projects = @user.projects.order("updated_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
  end
end