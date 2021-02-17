class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :full_name, :email, :password
end
