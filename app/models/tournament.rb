class Tournament < ApplicationRecord
  has_many :teams
  has_many :groups
  has_many :games
end
