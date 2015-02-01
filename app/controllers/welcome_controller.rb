class WelcomeController < ApplicationController
  def index
    redirect_to my_team_path if current_user
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if signup_service.call(@signup)
        sign_in User.last
        format.html { redirect_to my_team_path, notice: 'Signup successfull.' }
      else
        format.html { render :index }
      end
    end
  end

  def my_team
    @team = Team.find(current_user.team.id)
  end

  private

  def signup_params
    params.require(:signup).permit(:email, :password, :password_confirmation, :team_name)
  end

  def signup_service
    @signup_service ||= SignupService.new
  end
end