class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: {message: 'must be provided, please'}
  validates :email, presence: true, uniqueness: {message: 'is being used by another account'}
  

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

  def first_name_last_initial
    "#{first_name} #{last_name[0]}."
  end

  def available_projects
    # Returns all projects on which the current_user is the creator or a member
    available = []
    available << Project.where(creator: self)
    available << self.memberships.map do |membership| membership.project end
    # Flatten
    available_flattened = available.flatten
    # Remove duplicates
    available_unique = available_flattened.uniq
  end

  def member?(project_id)
    project = Project.find(project_id)
    project.members.include?(self)
  end
end
