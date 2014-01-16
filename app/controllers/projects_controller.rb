class ProjectsController < ApplicationController
  include Authenticationable

  def index
    @projects = Project.where(user_id: current_user.id)
    render json: @projects
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.save
      render json: { success: true }
    else
      render json: { success: false, errors: @project.errors }
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end
end
