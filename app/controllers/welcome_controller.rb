class WelcomeController < ApplicationController
  def index
    redirect_to team_path(current_user.team) if current_user
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if signup_service.call(@signup)
        format.html { redirect_to team_path(current_user.team), notice: 'Signup successfull.' }
      else
        format.html { render root_path }
      end
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:email, :password, :password_confirmation, :team_name)
  end

  def signup_service
    @signup_service ||= SignupService.new
  end
end