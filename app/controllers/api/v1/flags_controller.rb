class Api::V1::FlagsController < ApplicationController

  def create
    flag = Flag.create!(flag_params)
    render json: flag
  end

  def destroy
    flag = Flag.find(params[:id])
    flag.destroy
    render json: "Successfully deleted"
  end

  private

  def flag_params
  params.require(:flag).permit(:user_id, :task_id)
  end

end
