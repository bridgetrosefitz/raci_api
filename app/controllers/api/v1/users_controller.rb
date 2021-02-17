class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

end
