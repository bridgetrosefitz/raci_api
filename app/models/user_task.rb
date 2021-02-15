class UserTask < ApplicationRecord

  belongs_to :function, class_name: "Function", foreign_key: "function_id"
  belongs_to :task, class_name: "Task", foreign_key: "task_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  
end
