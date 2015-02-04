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
        format.html { render admin_path }
      end
    end
  end
end