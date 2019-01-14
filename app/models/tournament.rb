class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :games, dependent: :destroy
end
