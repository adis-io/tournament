class ResultsController < ApplicationController
  def generate
    result_generator = ResultGenerator.new(params['tournament_id'])
    result_generator.generate(params['stage'])

    notice = 'Results was successfully generated.'
    redirect_to tournament_path(params['tournament_id']), notice: notice
  end
end
