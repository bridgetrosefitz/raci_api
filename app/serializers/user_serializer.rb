class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :full_name, :email, :initials, :first_name, :last_name
end
