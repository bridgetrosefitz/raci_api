class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator, :members

attributes :tasks do |project|  
    project.tasks.map do |task| 
        responsible = []
        accountable = []
        consulted = []
        informed = []
        task.user_tasks.each do |user_task|
          user_task_hash = {
              user_task_id: task.user_task.id,
              function_id: task.user_task.function_id,
              user_id: task.user_task.user_id,
              user_full_name: task.user_task.user.full_name
            }

          if user_task.function_id == 1
            responsible << user_task_hash
          elsif user_task.function_id == 1
          elsif user_task.function_id == 1
          elsif user_task.function_id == 1
          end
        end
        
        {
          id: task.id,
          task_name: task.text,
          responsible: responsible
        }
      end
    end


end

[
            {
              user_task_id: task.user_task.id,
              function_id: task.user_task.function_id,
              user_id: task.user_task.user_id,
              user_full_name: task.user_task.user.full_name
            }
          ]

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
