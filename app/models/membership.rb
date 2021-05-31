class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user, uniqueness: {scope: :project, message: 'is already a member of this project.'}
  
  before_destroy :destroy_user_tasks

  # default_scope { order(created_at: :asc)}
  # scope :desc, order("memberships.last_name DESC")

  def destroy_user_tasks

    user = self.user
    project = self.project
    
    user.user_tasks.each do |user_task| 
      if user_task.project == project
        user_task.destroy!
      end 
    end

  end

end
