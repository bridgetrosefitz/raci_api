class ProjectsController < ApplicationController

  def index
    projects = Project.all
    render json: ProjectSerializer.new(projects)
  end

  def show
    project = Project.find(params[:id])
    render json: ProjectSerializer.new(project)
  end

  def create
    project = Project.create(name: params[:name], creator_id: params[:creator_id])
    render json: ProjectSerializer.new(project)
  end
  
  # def update
  # end
    
  # def destroy
  # end

end
