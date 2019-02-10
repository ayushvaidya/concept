class Card < ApplicationRecord

  acts_as_list scope: :category

  belongs_to :list
  belongs_to :epic
end
