class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :projects, class_name: "Project", foreign_key: "creator_id"
  has_many :user_tasks
  has_many :tasks, through: :user_tasks

  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
  end
end
