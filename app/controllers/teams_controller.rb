class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @teams = Team.all
    respond_with(@teams)
  end

  def show
    respond_with(@team)
  end

  def new
    @team = Team.new
    respond_with(@team)
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user
    @team.balance = 10**9
    @team.save

    20.times do
      player = Player.new
      loop do
        player.first_name = Faker::Name.first_name
        break if player.first_name[-1, 1] != "a"
      end
      player.last_name = Faker::Name.last_name
      player.birthdate = Faker::Date.between(Date.today - 30.years, Date.today - 18.years)
      player.salary = 10000
      player.position = ["GK", "D", "DM", "OM", "S"].sample
      base = player.position == "GK" ? 10 : 1
      player.reflex = base + rand(10)
      player.handling = base + rand(10)
      base = player.position == "D" ? 10 : 1
      player.discipline = base + rand(10)
      player.tackling = base + rand(10)
      base = player.position == "DM" ? 10 : 1
      player.work_rate = base + rand(10)
      player.positioning = base + rand(10)
      base = player.position == "OM" ? 10 : 1
      player.creativity = base + rand(10)
      player.technique = base + rand(10)
      base = player.position == "S" ? 10 : 1
      player.instinct = base + rand(10)
      player.shots = base + rand(10)

      player.condition = 1 + rand(20)
      
      player.team = @team

      player.save
    end

    respond_with(@team)
  end

  def update
    @team.update(team_params)
    respond_with(@team)
  end

  def destroy
    @team.destroy
    respond_with(@team)
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :balance)
    end
end
