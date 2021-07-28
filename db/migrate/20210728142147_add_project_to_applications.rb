class AddProjectToApplications < ActiveRecord::Migration[6.1]
  def change
    add_reference :applications, :project, null: false, foreign_key: true
  end
end
