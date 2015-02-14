class PlayersController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def show
    @player = Player.find(params[:id])
    respond_with(@player)
  end
end
