# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Function.create!(name:"Responsible", description:"The person who carries out the work to complete this task") 
Function.create!(name:"Accountable", description: "The person who must ensure that the work gets done, and who will bear the consequences if it does not get done.")
Function.create!(name:"Consulted", description: "The person or people whose input must be sought for key decisions while carrying out the work.")
Function.create!(name:"Informed", description: "The person or people who must be kept informed about progress and key developments.")

User.create!(first_name: "Bridget", last_name: "Fitzgerald", email: "bridgetrosefitz@gmail.com", password: "test")
User.create!(first_name: "Kevin", last_name: "McAlear", email: "kevin.mcalear@gmail.com", password: "test")
User.create!(first_name: "Patrick", last_name: "Fitzgerald", email: "patrick@test.com", password: "test")

Project.create!(name: "Creating Bridget's first project", creator_id: 1)
Project.create!(name: "Creating Kevin's first project", creator_id: 2)
Project.create!(name: "Creating Patrick's first project", creator_id: 3)

Task.create!(text: "Define your first task", project_id: 1)
Task.create!(text: "Define your second task", project_id: 1)
Task.create!(text: "Define your third task", project_id: 1)
Task.create!(text: "Define your fourth task", project_id: 1)

UserTask.create!(task_id: 1, function_id: 1, user_id: 1)
UserTask.create!(task_id: 1, function_id: 2, user_id: 1)
UserTask.create!(task_id: 1, function_id: 3, user_id: 2)
UserTask.create!(task_id: 1, function_id: 4, user_id: 2)
UserTask.create!(task_id: 2, function_id: 1, user_id: 1)
UserTask.create!(task_id: 2, function_id: 2, user_id: 1)
UserTask.create!(task_id: 2, function_id: 3, user_id: 1)
UserTask.create!(task_id: 2, function_id: 4, user_id: 1)
UserTask.create!(task_id: 3, function_id: 1, user_id: 2)
UserTask.create!(task_id: 3, function_id: 2, user_id: 2)
UserTask.create!(task_id: 3, function_id: 3, user_id: 2)
UserTask.create!(task_id: 3, function_id: 4, user_id: 2)
UserTask.create!(task_id: 4, function_id: 1, user_id: 2)
UserTask.create!(task_id: 4, function_id: 2, user_id: 2)
UserTask.create!(task_id: 4, function_id: 3, user_id: 1)
UserTask.create!(task_id: 4, function_id: 3, user_id: 2)
UserTask.create!(task_id: 4, function_id: 4, user_id: 2)

Membership.create!(user_id: 1, project_id: 2)
Membership.create!(user_id: 2, project_id: 2)
Membership.create!(user_id: 3, project_id: 2)

Flag.create!(user_id: 1, task_id: 1)