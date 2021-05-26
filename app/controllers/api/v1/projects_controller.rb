class Api::V1::ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: ProjectSerializer.new(projects)
  end

  def show
    project = Project.find(params[:id])
    if current_user.member?(params[:id]) || project.creator == current_user
      render json: ProjectSerializer.new(project)
    else
      render json: {errors: ["Not authorized"]}, status: :unauthorized
    end
  end

  def create
    project = Project.create(project_params)
    render json: ProjectSerializer.new(project)
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    render json: ProjectSerializer.new(project)
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render json: "Successfully deleted"
  end

  private

  def project_params
    params.require(:project).permit(:name, :creator_id)
  end

end
