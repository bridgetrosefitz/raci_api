class UserTaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :task, :user, :function, :project
end
