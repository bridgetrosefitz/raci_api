class AddProjectIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :project_id, :integer
  end
end
