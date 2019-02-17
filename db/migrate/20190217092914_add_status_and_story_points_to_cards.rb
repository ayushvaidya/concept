class AddStatusAndStoryPointsToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :status, :string
    add_column :cards, :story_points, :integer
  end
end
