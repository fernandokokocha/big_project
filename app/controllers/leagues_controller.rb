class LeaguesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def list
    @team = Team.find(current_user.team)
    @my_leagues = League.all
    @leagues = League.all
    render 'admin/leagues/list'
  end
end
