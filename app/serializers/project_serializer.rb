class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :creator, :members

attributes :tasks do |project|
    debugger  
    project.tasks.map do |task| 
        # debugger
        {
          id: task.id,
          task_name: task.text
          responsible: [
            {
              user_task_id: task.user_task.id,
              function_id: task.user_task.function_id,

            }
          ]
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
