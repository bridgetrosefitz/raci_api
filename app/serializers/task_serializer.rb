class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :project_id, :user_tasks, :members
  
  # Example code from https://medium.com/@natj/creating-custom-attributes-for-serialization-bd5518514544
  # attributes :high_score do |object|
  #   object.games.map(&:score).max

    attributes :user_task_user_full_name do |task|
      task.user_tasks.map {|user_task| user_task.user.full_name}
    end
end
        # Things I need in my endpoint

        # - UserTask
        # - (Attribute): user_task.user.full_name
        # - (Attribute): user_task.function.name