class Epic < ApplicationRecord
  has_many :lists
  has_many :cards
end
