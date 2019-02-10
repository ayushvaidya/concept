class Project < ApplicationRecord
  belongs_to :user
  has_many :epics
  has_many :lists
  has_many :cards
end
