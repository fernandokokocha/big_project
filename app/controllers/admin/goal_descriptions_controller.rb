class Admin::GoalDescriptionsController < ApplicationController
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
    @goal_descriptions = GoalDescription.all
  end

  def show
  end

  def new
    @goal_description = GoalDescription.new
  end

  def edit
  end

  def create
    @goal_description = GoalDescription.new(goal_description_params)
    respond_to do |format|
      if @goal_description.save
        format.html { redirect_to admin_goal_descriptions_path, notice: 'Goal description was successfully created.' }
        format.json { render :show, status: :created, location: @goal_description }
      else
        format.html { render :new }
        format.json { render json: @goal_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @goal_description.update(goal_description_params)
        format.html { redirect_to admin_goal_descriptions_path, notice: 'Goal description was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_description }
      else
        format.html { render :edit }
        format.json { render json: @goal_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @goal_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_goal_descriptions_path, notice: 'Goal description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @goal_description = GoalDescription.find(params[:id])
  end

  def goal_description_params
    params.require(:goal_description).permit(:description)
  end
end