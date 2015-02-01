class DoubleYellowCardDescriptionsController < ApplicationController
  before_action :set_double_yellow_card_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @double_yellow_card_descriptions = DoubleYellowCardDescription.all
    respond_with(@double_yellow_card_descriptions)
  end

  def show
    respond_with(@double_yellow_card_description)
  end

  def new
    @double_yellow_card_description = DoubleYellowCardDescription.new
    respond_with(@double_yellow_card_description)
  end

  def edit
  end

  def create
    @double_yellow_card_description = DoubleYellowCardDescription.new(double_yellow_card_description_params)
    @double_yellow_card_description.save
    respond_with(@double_yellow_card_description)
  end

  def update
    @double_yellow_card_description.update(double_yellow_card_description_params)
    respond_with(@double_yellow_card_description)
  end

  def destroy
    @double_yellow_card_description.destroy
    respond_with(@double_yellow_card_description)
  end

  private
    def set_double_yellow_card_description
      @double_yellow_card_description = DoubleYellowCardDescription.find(params[:id])
    end

    def double_yellow_card_description_params
      params.require(:double_yellow_card_description).permit(:description)
    end
end
