class PlayOffGenerator
  include GeneratorHelper

  def initialize(tournament)
    @tournament = tournament
  end

  def generate
    create_game(4, 'Quarter final', teams_in_play_off)
    create_game(2, 'Semi final', teams_in_semi_final)
    create_game(1, 'Final', teams_in_final)
  end

  private

  def teams_in_play_off
    Team.where(id: group_a + group_b).order(wins: :desc)
  end

  def teams_in_semi_final
    Team.where(id: teams_in_semi_final_ids).order(wins: :desc)
  end

  def teams_in_semi_final_ids
    @tournament.games.quarter_final.pluck(:winner_id)
  end

  def teams_in_final
    Team.where(id: teams_in_final_ids).order(wins: :desc)
  end

  def teams_in_final_ids
    @tournament.games.semi_final.pluck(:winner_id)
  end

  def group_a
    @tournament.teams.group_a.order(wins: :desc).first(4).pluck(:id)
  end

  def group_b
    @tournament.teams.group_b.order(wins: :desc).first(4).pluck(:id)
  end

  def create_game(number_of_games, stage, games)
    number_of_games.times do |counter|
      first_team = games[counter]
      second_team = games[counter * (-1) - 1]
      Game.create(
        first_team_id: first_team.id,
        second_team_id: second_team.id,
        winner_id: randomize_winner(first_team, second_team).id,
        stage: stage,
        tournament_id: @tournament.id
      )
    end
  end
end
