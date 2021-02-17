class Api::V1::TasksController < ApplicationController

  def index
    tasks = Task.all
    render json: TaskSerializer.new(tasks)
  end

  def show
    task = Task.find(params[:id])
    render json: TaskSerializer.new(task)
  end 

  def create
    task = Task.create!(task_params)
    render json: TaskSerializer.new(task)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    render json: TaskSerializer.new(task)
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    render json: TaskSerializer.new(task)
  end

  def destroy
    task = Task.find(params[:id])
    task.delete
    render json: "Successfully deleted"
  end

  private
  
  def task_params
    params.require(:task).permit(:text, :project_id)
  end
end 
