class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(user_params)

    if user.valid?
      payload = { user_id: user.id }
      token = JWT.encode(payload, "codingiscool", "HS256")
      render json: {token: token}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity 
    end
  end

  def profile
    render json: current_user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

end
