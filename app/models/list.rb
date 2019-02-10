class List < ApplicationRecord
  belongs_to :epic
  has_many :cards
end
