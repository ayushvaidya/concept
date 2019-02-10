class AddProjectToLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :lists, :project, foreign_key: true
  end
end
