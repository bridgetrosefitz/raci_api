class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :project_id, :members
  
  # Example code from https://medium.com/@natj/creating-custom-attributes-for-serialization-bd5518514544
  # attributes :high_score do |object|
  #   object.games.map(&:score).max

    attributes :flags do |task|
      task.flags.map do |flag| 
        {
          flag_id: flag.id,
          user_id: flag.user_id,
          user_initials: flag.user.initials,
          user_full_name: flag.user.full_name,
          user_first_name_last_initial: flag.user_first_name_last_initial
        }
      end
    end

    attributes :user_tasks do |task|
      task.user_tasks.map do |user_task| 
        {
          user_id: user_task.user_id,
          function_id: user_task.function_id,
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
#    "responsible": ["tom"]
#    "accountable": ["kevin"],
#    "consulted": ["patrick"]
#    "informed": ["kathleen", "eloise"],
# is_flagged: yes
#  }
# }

# task: {
#  id: 1,
#  name: "kevin's task"
#  user_tasks: [{
#    "responsible": 
#     {"user_task_id": 1,
#      "user_id": 1,
#       "full_name": "Bridget Fitzgerald",
#      "function": "Responsible"

#     }],
#    "accountable": ["kevin"],
#    "consulted": ["patrick"]
#    "informed": ["kathleen", "eloise"],
# is_flagged: yes
#  }
# }