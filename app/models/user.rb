class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :projects, class_name: "Project", foreign_key: "creator_id", dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
  has_many :memberships, dependent: :destroy
  has_many :participating_projects, through: :memberships, source: :project
  has_many :flags, dependent: :destroy
  has_many :flagged_tasks, through: :flags, source: :task

  def full_name
    full_name = "#{self.first_name} #{self.last_name}"
  end

  def initials
    "#{first_name[0]}#{last_name[0]}"
  end
end
