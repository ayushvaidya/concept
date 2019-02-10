class AddUserToEpics < ActiveRecord::Migration[5.2]
  def change
    add_reference :epics, :user, foreign_key: true
  end
end
