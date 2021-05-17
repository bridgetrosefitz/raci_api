class Api::V1::UsersController < ApplicationController

  skip_before_action :current_user, only: [:create]
  
  def create
    user = User.create!(user_params)

    if user.valid?
      render json: {token: encode_token(user)}
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity 
    end
  end

  def profile
    user = current_user
    render json: UserSerializer.new(current_user)
  end

  def index
    render json: UserSerializer.new(User.all)
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

end
