class TeamsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def show
    @team = Team.find(params[:id])
    respond_with(@team)
  end

  def my_team
    @team = Team.find(current_user.team.id)
  end

  def players
    @team = Team.find(current_user.team.id)
  end

  def tactic
    @team = Team.find(current_user.team.id)
  end

  def stadium
    @team = Team.find(current_user.team.id)
  end

  def finance
    @team = Team.find(current_user.team.id)
  end
end
