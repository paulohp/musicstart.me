class PagesController < ApplicationController
  def index
    @projects_in_home = Project.where('show_home = true').limit(3)
    @projectos_quase_acabando = Project.where('successful = true').limit(3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects_in_home }
    end
  end
end
