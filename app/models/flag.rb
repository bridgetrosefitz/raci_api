class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :task
  
  validates :user_id, uniqueness: { scope: :task_id,
    message: "one flag per user per task only" }
end
