class SoloGoalDescriptionsController < ApplicationController
  before_action :set_solo_goal_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @solo_goal_descriptions = SoloGoalDescription.all
    respond_with(@solo_goal_descriptions)
  end

  def show
    respond_with(@solo_goal_description)
  end

  def new
    @solo_goal_description = SoloGoalDescription.new
    respond_with(@solo_goal_description)
  end

  def edit
  end

  def create
    @solo_goal_description = SoloGoalDescription.new(solo_goal_description_params)
    @solo_goal_description.save
    respond_with(@solo_goal_description)
  end

  def update
    @solo_goal_description.update(solo_goal_description_params)
    respond_with(@solo_goal_description)
  end

  def destroy
    @solo_goal_description.destroy
    respond_with(@solo_goal_description)
  end

  private
    def set_solo_goal_description
      @solo_goal_description = SoloGoalDescription.find(params[:id])
    end

    def solo_goal_description_params
      params.require(:solo_goal_description).permit(:description)
    end
end
