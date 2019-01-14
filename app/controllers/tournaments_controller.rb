class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :destroy]

  def index
    @tournaments = Tournament.all
  end

  def show; end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)

    if @tournament.save && team_params_present?
      save_teams
      redirect_to @tournament, notice: 'Tournament was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_url, notice: 'Tournament was successfully destroyed.'
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(:name)
  end

  def team_params_present?
    16.times do |counter|
      return false unless params['tournament']["team#{counter}_name"].present?
    end
    true
  end

  def save_teams
    16.times do |counter|
      @tournament.teams.create(
        name: params['tournament']["team#{counter}_name"]
      )
    end
  end
end
