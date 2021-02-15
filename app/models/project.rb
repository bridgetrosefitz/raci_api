class Project < ApplicationRecord

  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :tasks
  
end
