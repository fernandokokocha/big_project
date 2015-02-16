class AdminController < ApplicationController
  before_action do
    unless current_user && current_user.admin?
      flash[:alert] = 'Secured!'
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def grant
    @user = User.find(params[:id])
    @user.admin = true

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_path, notice: "Admin rights granted to #{@user}." }
      else
        format.html { render 'index' }
      end
    end
  end

  def next_round
    @users = User.all
    respond_to do |format|
      if next_round_service.call
        format.html { redirect_to admin_path, notice: 'Next round generated.' }
      else
        format.html { render 'index' }
      end
    end
  end

  def next_round_service
    @next_round_service ||= NextRound.new
  end
end