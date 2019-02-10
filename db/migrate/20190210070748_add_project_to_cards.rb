class AddProjectToCards < ActiveRecord::Migration[5.2]
  def change
    add_reference :cards, :project, foreign_key: true
  end
end
