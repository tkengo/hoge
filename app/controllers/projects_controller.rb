class ProjectsController < ApplicationController
  def create
    @project = Project.create(project_params)
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
