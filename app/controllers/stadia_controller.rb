class StadiaController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def show
    @stadium = Stadium.find(params[:id])
    respond_with(@stadium)
  end
end
