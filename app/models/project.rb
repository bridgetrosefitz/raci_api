class Project < ApplicationRecord

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :tasks

  def task_list
    self.tasks.map do |task|
      task.text
    end
  end

  def members
    users_on_all_tasks = self.tasks.map do |task|
      task.users
    end
    users_on_all_tasks_flattened = users_on_all_tasks.flatten
    unique_users = users_on_all_tasks_flattened.uniq

  end

  def creator
    User.find(self.creator_id)
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
