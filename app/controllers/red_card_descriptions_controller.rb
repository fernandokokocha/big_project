class RedCardDescriptionsController < ApplicationController
  before_action :set_red_card_description, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @red_card_descriptions = RedCardDescription.all
    respond_with(@red_card_descriptions)
  end

  def show
    respond_with(@red_card_description)
  end

  def new
    @red_card_description = RedCardDescription.new
    respond_with(@red_card_description)
  end

  def edit
  end

  def create
    @red_card_description = RedCardDescription.new(red_card_description_params)
    @red_card_description.save
    respond_with(@red_card_description)
  end

  def update
    @red_card_description.update(red_card_description_params)
    respond_with(@red_card_description)
  end

  def destroy
    @red_card_description.destroy
    respond_with(@red_card_description)
  end

  private
    def set_red_card_description
      @red_card_description = RedCardDescription.find(params[:id])
    end

    def red_card_description_params
      params.require(:red_card_description).permit(:description)
    end
end
