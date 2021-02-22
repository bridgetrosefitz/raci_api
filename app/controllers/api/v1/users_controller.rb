class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(user_params)

    if user.valid?
      render json: {token: encode_token(user)}
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
