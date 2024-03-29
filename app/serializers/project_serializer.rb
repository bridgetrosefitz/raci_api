class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator

attributes :members do |project|  
  project.memberships.map do |membership|

    {
      id: membership.user.id,
      full_name: membership.user.full_name,
      first_name: membership.user.first_name,
      last_name: membership.user.last_name,
      initials: membership.user.initials,
      first_name_last_initial: membership.user.first_name_last_initial,
      membership_id: membership.id
    }
  end.sort_by do |membership_hash| 
    membership_hash[:last_name]
  end
end

attributes :tasks do |project|  
    project.tasks.map do |task| 
        responsible = []
        accountable = []
        consulted = []
        informed = []
        task.user_tasks.each do |user_task|
          user_task_hash = {
            user_task_id: user_task.id,
            function_id: user_task.function_id,
            user_id: user_task.user_id,
            task_id: user_task.task_id,
            user_full_name: user_task.user.full_name,
            user_first_name: user_task.user.first_name,
            user_first_name_last_initial: user_task.user.first_name_last_initial
          }

          if user_task.function_id == 1
            responsible << user_task_hash
          elsif user_task.function_id == 2
            accountable << user_task_hash
          elsif user_task.function_id == 3
            consulted << user_task_hash
          elsif user_task.function_id == 4
            informed << user_task_hash
          end
        end
        
        user_flags = task.flags.map do |flag| 
          {
            flag_id: flag.id, 
            user_id: flag.user_id, 
            user_initials: flag.user.initials,
            user_full_name: flag.user.full_name,
            user_first_name: flag.user.first_name,
            user_first_name_last_initial: flag.user.first_name_last_initial
          }
        end

        {
          id: task.id,
          task_name: task.text,
          responsible: responsible,
          accountable: accountable,
          consulted: consulted,
          informed: informed,
          flags: user_flags
        }
      end
    end


end

# {
#   id: 1,
#   type: project,
#   attributes: {
#     tasks: [
#       {
#         id:1,
#         name: "taskaroo",
#         responsible: [
#           {
#             id: 1,
#             function_id: 1,
#             user_id: 2,
#             task_id: 1,
#             full_name: "Bridget Fitzgerald"
#           },
#         ],
#         accountable: [
#           {
#             id: 2,
#             function_id: 2,
#             user_id: 2,
#             task_id: 1,
#             full_name: "Bridget Fitzgerald"
#           }
#         ],
#         consulted: [
#           {
#             id: 3, 
#             function_id: 3,
#             user_id: 3,
#             task_id: 1,
#             full_name: "Kevin McAlear"
#           },
#           {
#             id: 4,
#             function_id: 3,
#             user_id: 4,
#             task_id: 1,
#             full_name: "Eloise Watson"
#           }
#         ],
#         informed: [
#           {
#             id: 5,
#             function_id: 4,
#             user_id: 5,
#             task_id: 1,
#             full_name: "Theo Lenoir"
            
#           },
#           {
#             id: 6,
#             function_id: 4,
#             user_id: 6,
#             task_id: 1,
#             full_name: "Julien Chartier"
#           }
#         ]
#         ]
#       }
#     ]
#   }
# }
