class InjuryDescriptionsController < ApplicationController
  before_action :set_injury_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @injury_descriptions = InjuryDescription.all
    respond_with(@injury_descriptions)
  end

  def show
    respond_with(@injury_description)
  end

  def new
    @injury_description = InjuryDescription.new
    respond_with(@injury_description)
  end

  def edit
  end

  def create
    @injury_description = InjuryDescription.new(injury_description_params)
    @injury_description.save
    respond_with(@injury_description)
  end

  def update
    @injury_description.update(injury_description_params)
    respond_with(@injury_description)
  end

  def destroy
    @injury_description.destroy
    respond_with(@injury_description)
  end

  private
    def set_injury_description
      @injury_description = InjuryDescription.find(params[:id])
    end

    def injury_description_params
      params.require(:injury_description).permit(:description)
    end
end
