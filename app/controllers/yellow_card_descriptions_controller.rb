class YellowCardDescriptionsController < ApplicationController
  before_action :set_yellow_card_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @yellow_card_descriptions = YellowCardDescription.all
    respond_with(@yellow_card_descriptions)
  end

  def show
    respond_with(@yellow_card_description)
  end

  def new
    @yellow_card_description = YellowCardDescription.new
    respond_with(@yellow_card_description)
  end

  def edit
  end

  def create
    @yellow_card_description = YellowCardDescription.new(yellow_card_description_params)
    @yellow_card_description.save
    respond_with(@yellow_card_description)
  end

  def update
    @yellow_card_description.update(yellow_card_description_params)
    respond_with(@yellow_card_description)
  end

  def destroy
    @yellow_card_description.destroy
    respond_with(@yellow_card_description)
  end

  private
    def set_yellow_card_description
      @yellow_card_description = YellowCardDescription.find(params[:id])
    end

    def yellow_card_description_params
      params.require(:yellow_card_description).permit(:description)
    end
end
