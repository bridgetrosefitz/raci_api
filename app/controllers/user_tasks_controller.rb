class UserTasksController < ApplicationController

  private

  def user_tasks_params
    params.require(:user_task).require(:)
  end
end
