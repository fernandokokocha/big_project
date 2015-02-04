class Admin::SoloGoalDescriptionsController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action do
    unless current_user && current_user.admin?
      flash[:alert] = 'Secured!'
      redirect_to root_path
    end
  end

  respond_to :html

  def index
    @solo_goal_descriptions = SoloGoalDescription.all
  end

  def show
  end

  def new
    @solo_goal_description = SoloGoalDescription.new
  end

  def edit
  end

  def create
    @solo_goal_description = SoloGoalDescription.new(solo_goal_description_params)
    respond_to do |format|
      if @solo_goal_description.save
        format.html { redirect_to admin_solo_goal_descriptions_path, notice: 'SoloGoal description was successfully created.' }
        format.json { render :show, status: :created, location: @solo_goal_description }
      else
        format.html { render :new }
        format.json { render json: @solo_goal_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @solo_goal_description.update(solo_goal_description_params)
        format.html { redirect_to admin_solo_goal_descriptions_path, notice: 'Solo Goal description was successfully updated.' }
        format.json { render :show, status: :ok, location: @solo_goal_description }
      else
        format.html { render :edit }
        format.json { render json: @solo_goal_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @solo_goal_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_solo_goal_descriptions_path, notice: 'Solo Goal description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @solo_goal_description = SoloGoalDescription.find(params[:id])
  end

  def solo_goal_description_params
    params.require(:solo_goal_description).permit(:description)
  end
end