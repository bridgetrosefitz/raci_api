class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator, :tasks, :members
end
