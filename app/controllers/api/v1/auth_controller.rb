class Api::V1::AuthController < ApplicationController

  skip_before_action :current_user

  def create
    user = User.find_by(email: params[:email])
    is_authenticated = user.authenticate(params[:password]) if user
    
    
    if is_authenticated
      render json: { token: encode_token(user) }
    else
      render json: {errors: ["Wrong email or password"]}, status: :unprocessable_entity
    end
  end
end