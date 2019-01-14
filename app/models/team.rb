class Team < ApplicationRecord
  belongs_to :tournament

  enum stage: {
    group_a: 'Group A',
    group_b: 'Group B',
    quarter_final: 'Quarter final',
    semi_final: 'Semi final',
    final: 'Final'
  }
end
