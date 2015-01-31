class YellowCardsController < ApplicationController
  before_action :set_yellow_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @yellow_cards = YellowCard.all
    respond_with(@yellow_cards)
  end

  def show
    respond_with(@yellow_card)
  end

  def new
    @yellow_card = YellowCard.new
    respond_with(@yellow_card)
  end

  def edit
  end

  def create
    @yellow_card = YellowCard.new(yellow_card_params)
    @yellow_card.save
    respond_with(@yellow_card)
  end

  def update
    @yellow_card.update(yellow_card_params)
    respond_with(@yellow_card)
  end

  def destroy
    @yellow_card.destroy
    respond_with(@yellow_card)
  end

  private
    def set_yellow_card
      @yellow_card = YellowCard.find(params[:id])
    end

    def yellow_card_params
      params[:yellow_card]
    end
end
