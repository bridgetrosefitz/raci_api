class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :full_name, :email, :initials, :first_name, :last_name, :first_name_last_initial
end
