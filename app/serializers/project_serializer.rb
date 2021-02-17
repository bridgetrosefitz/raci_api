class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator, :tasks, :user_tasks, :members
end
