class User < ApplicationRecord
  has_secure_password

  has_many :projects, class_name: "Project", foreign_key: "creator_id"
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  # has_many :user_tasks, class_name: "user_task", foreign_key: "user_id"
  # has_many :tasks, through: :user_tasks
  
end
