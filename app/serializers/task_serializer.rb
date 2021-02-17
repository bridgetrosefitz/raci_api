class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :project_id, :user_tasks, :members
end
