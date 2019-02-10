class AddProjectToEpic < ActiveRecord::Migration[5.2]
  def change
    add_reference :epics, :project, foreign_key: true
  end
end
