class GroupsController < ApplicationController
  def generate
    group_builder = GroupBuilder.new(params['tournament_id'])
    group_builder.generate_groups

    notice = 'Groups was successfully created.'
    redirect_to tournament_path(params['tournament_id']), notice: notice
  end
end
