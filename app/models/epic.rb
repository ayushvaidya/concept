class Epic < ApplicationRecord
  belongs_to :user
  belongs_to :project

  has_many :lists, :dependent => :delete_all
  has_many :cards, :dependent => :delete_all
end
