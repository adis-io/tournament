class StageAGenerator
  include GeneratorHelper

  def initialize(tournament)
    @tournament = tournament
    @already_played = []
  end

  def generate
    create_games(@tournament.groups.a, 'Group A')
  end
end
