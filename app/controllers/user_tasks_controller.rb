class UserTasksController < ApplicationController

  def index
    user_tasks = UserTask.all
    render json: UserTaskSerializer.new(user_tasks)
  end

  def create
    user_task = UserTask.create(user_tasks_params)
    render json: UserTaskSerializer.new(user_task)
  end

 
  def update
    user_task = UserTask.find(params[:id])
    user_task.update(user_tasks_params)
    render json: UserTaskSerializer.new(user_task)
  end

  def destroy
  user_task = UserTask.delete(params[:id])
  render json: "Successfuly deleted"
  end

  private

  def user_tasks_params
    params.require(:user_task).permit(:user_id, :task_id, :function_id)
  end
end
