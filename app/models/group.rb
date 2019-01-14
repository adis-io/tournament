class Group < ApplicationRecord
  belongs_to :tournament
  belongs_to :team

  enum name: { a: 'A', b: 'B' }
end
