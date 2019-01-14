module GeneratorHelper
  def create_games(teams, stage)
    teams.each do |group_a_first|
      @already_played << group_a_first
      not_played = teams - @already_played

      not_played.each do |group_a_second|
        winner = randomize_winner(group_a_first, group_a_second)
        update_wins_for_winner(winner.team)
        Game.create(
          first_team_id: group_a_first.team_id,
          second_team_id: group_a_second.team_id,
          winner_id: winner.team_id,
          stage: stage,
          tournament_id: @tournament.id
        )
      end
    end
  end

  private

  def randomize_winner(first, second)
    random_number = rand(2)
    array_of_teams = [first, second]
    array_of_teams[random_number]
  end

  def update_wins_for_winner(team)
    team.wins += 1
    team.save
  end
end
