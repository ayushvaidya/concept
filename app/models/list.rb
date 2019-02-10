class List < ApplicationRecord
  belongs_to :user
  belongs_to :project
  belongs_to :epic
  has_many :cards, :dependent => :delete_all
end
