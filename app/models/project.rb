class Project < ApplicationRecord

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :tasks
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  # Note: If the foreign_key is the same as the class name, you don't need to specify foreign_key


  def task_list
    self.tasks.map do |task|
      task.text
    end
  end

  def creator
    User.find(self.creator_id)
  end

  def user_tasks
    self.tasks.map do |task| 
      task.user_tasks
    end.flatten
  end

  #  def members_names

    #  array =  self.tasks.map do |task|
    #     task.users.map do |user|
    #       user.first_name
    #     end
    #   end
    #   array = array.flatten
    #   array = array.uniq
      
  # end
  
end
