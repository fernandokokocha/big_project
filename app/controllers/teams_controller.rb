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

  def new_logo
    return redirect_to my_team_path, :notice => 'No image selected' if params[:team].nil?
    return redirect_to my_team_path, :notice => 'No image selected' if params[:team][:logo].nil?
    @team = Team.find(current_user.team.id)
    @team.update(params.require(:team).permit(:logo))
    redirect_to my_team_path
  end

  def league
    @teams = Team.all.sort {|a,b| a.points <=> b.points}.reverse!
  end

  def matches
    @matches = Match.order('date DESC').select {|match| match.participant? current_user.team}
  end
end
