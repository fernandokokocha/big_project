class RedCardsController < ApplicationController
  before_action :set_red_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @red_cards = RedCard.all
    respond_with(@red_cards)
  end

  def show
    respond_with(@red_card)
  end

  def new
    @red_card = RedCard.new
    respond_with(@red_card)
  end

  def edit
  end

  def create
    @red_card = RedCard.new(red_card_params)
    @red_card.save
    respond_with(@red_card)
  end

  def update
    @red_card.update(red_card_params)
    respond_with(@red_card)
  end

  def destroy
    @red_card.destroy
    respond_with(@red_card)
  end

  private
    def set_red_card
      @red_card = RedCard.find(params[:id])
    end

    def red_card_params
      params[:red_card]
    end
end
