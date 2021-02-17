class Task < ApplicationRecord

  belongs_to :project
  has_many :user_tasks
  has_many :users, through: :user_tasks

  def members
    users = self.users
    unique_users = users.uniq
  end
  
end
