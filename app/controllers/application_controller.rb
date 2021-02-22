class ApplicationController < ActionController::API

  def token
    request.headers["Authorization"].split(" ")[1]
  end

  def decoded_token
    JWT.decode(token, "codingiscool", true, { algorithm: "HS256"})
  end

  def current_user
    user_id = decoded_token[0]["user_id"]
    current_user = User.find(user_id)
  end

end
