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
    if params[:team].nil?
      return redirect_to my_team_path, :notice => 'No image selected'
    end
    if params[:team][:logo].nil?
      return redirect_to my_team_path, :notice => 'No image selected'
    end
    @team = Team.find(current_user.team.id)
    @team.update(params.require(:team).permit(:logo))
    redirect_to my_team_path
  end

  def league
    @teams = Team.all
  end
end
