class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :project_id, :members
  
  # Example code from https://medium.com/@natj/creating-custom-attributes-for-serialization-bd5518514544
  # attributes :high_score do |object|
  #   object.games.map(&:score).max

    attributes :user_task_info do |task|
      task.user_tasks.map do |user_task| 
        {
          user_task_id: user_task.id,
          full_name: user_task.user.full_name,
          function: user_task.function.name,

        }
      end
    end
end
        # Things I need in my endpoint

        # - UserTask
        # - (Attribute): user_task.id
        # - (Attribute): user_task.user.full_name
        # - (Attribute): user_task.function.name

# Example end point
# task: {
#  id: 1,
#  name: "kevin's task"
#  user_tasks: {
#    "accountable": ["kevin", "beef"],
#    "informed": 
#  }
# }