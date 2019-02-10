class Card < ApplicationRecord

  acts_as_list scope: :list

  belongs_to :user
  belongs_to :project
  belongs_to :epic
  belongs_to :list

end
