class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :first_team, class_name: 'Team', foreign_key: 'first_team_id'
  belongs_to :second_team, class_name: 'Team', foreign_key: 'second_team_id'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id'

  enum stage: {
    group_a: 'Group A',
    group_b: 'Group B',
    quarter_final: 'Quarter final',
    semi_final: 'Semi final',
    final: 'Final'
  }
end
