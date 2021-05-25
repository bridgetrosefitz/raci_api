class Task < ApplicationRecord

  belongs_to :project
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :flags, dependent: :destroy
  has_many :flagged_users, through: :flags, source: :user

  default_scope { order(created_at: :asc)}

  def members
    users = self.users
    unique_users = users.uniq
  end
  
end
