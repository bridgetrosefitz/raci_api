class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, uniqueness: {scope: :project, message: 'is already a member of this project.'}
  
  
end
