class Api::V1::AuthController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    is_authenticated = user.authenticate(params[:password]) if user
    
    
    if is_authenticated
      payload = { user_id: user.id }
      token = JWT.encode(payload, "codingiscool", "HS256")
      render json: { token: token }
    else
      render json: {errors: ["Wrong email or password"]}, status: :unprocessable_entity
    end
  end
end