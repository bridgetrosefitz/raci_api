class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :task
  
  validates :user_id, uniqueness: true
end
