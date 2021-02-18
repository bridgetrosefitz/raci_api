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
    token = request.headers["Authorization"]
    decoded_token = JWT.decode(token, "codingiscool", true, { algorithm: "HS256"} )
    user_id = decoded_token[0]["user_id"]
    user = User.find(user_id)

    render json: user
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

end
