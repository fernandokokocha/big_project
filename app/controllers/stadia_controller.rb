class StadiaController < ApplicationController
  before_action :set_stadium, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stadia = Stadium.all
    respond_with(@stadia)
  end

  def show
    respond_with(@stadium)
  end

  def new
    @stadium = Stadium.new
    respond_with(@stadium)
  end

  def edit
  end

  def create
    @stadium = Stadium.new(stadium_params)
    @stadium.save
    respond_with(@stadium)
  end

  def update
    @stadium.update(stadium_params)
    respond_with(@stadium)
  end

  def destroy
    @stadium.destroy
    respond_with(@stadium)
  end

  private
    def set_stadium
      @stadium = Stadium.find(params[:id])
    end

    def stadium_params
      params.require(:stadium).permit(:name, :capacity, :roof)
    end
end
