class GoalDescriptionsController < ApplicationController
  before_action :set_goal_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @goal_descriptions = GoalDescription.all
    respond_with(@goal_descriptions)
  end

  def show
    respond_with(@goal_description)
  end

  def new
    @goal_description = GoalDescription.new
    respond_with(@goal_description)
  end

  def edit
  end

  def create
    @goal_description = GoalDescription.new(goal_description_params)
    @goal_description.save
    respond_with(@goal_description)
  end

  def update
    @goal_description.update(goal_description_params)
    respond_with(@goal_description)
  end

  def destroy
    @goal_description.destroy
    respond_with(@goal_description)
  end

  private
    def set_goal_description
      @goal_description = GoalDescription.find(params[:id])
    end

    def goal_description_params
      params.require(:goal_description).permit(:description)
    end
end
