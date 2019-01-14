require_relative Rails.root.join('lib/ids_randomizer')

class GroupBuilder
  def initialize(tournament_id)
    @tournament = Tournament.find(tournament_id)
  end

  def generate_groups
    create_group_a
    generate_group_b
  end

  private

  def randomizer
    @randomizer ||= IdsRandomizer.new(team_ids)
  end

  def team_ids
    @team_ids ||= @tournament.teams.pluck(:id)
  end

  def create_group_a
    randomizer.first8.each do |id|
      Group.create(
        tournament_id: @tournament.id,
        name: 'A',
        team_id: id
      )
      update_team_stage(id, 'Group A')
    end
  end

  def generate_group_b
    randomizer.last8.each do |id|
      Group.create(
        tournament_id: @tournament.id,
        name: 'B',
        team_id: id
      )
      update_team_stage(id, 'Group B')
    end
  end

  def update_team_stage(id, stage)
    team = Team.find(id)
    team.update(stage: stage)
  end
end
