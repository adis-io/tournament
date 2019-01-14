class ResultGenerator
  GENERATORS = {
    'Group A' => StageAGenerator,
    'Group B' => StageBGenerator,
    'Play-off' => PlayOffGenerator
  }.freeze

  def initialize(tournament_id)
    @tournament = Tournament.find(tournament_id)
  end

  def generate(stage)
    generator = GENERATORS[stage].new(@tournament)
    generator.generate
  end
end
