class StageBGenerator
  include GeneratorHelper

  def initialize(tournament)
    @tournament = tournament
    @already_played = []
  end

  def generate
    create_games(@tournament.groups.b, 'Group B')
  end
end
