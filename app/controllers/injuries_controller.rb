class InjuriesController < ApplicationController
  before_action :set_injury, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @injuries = Injury.all
    respond_with(@injuries)
  end

  def show
    respond_with(@injury)
  end

  def new
    @injury = Injury.new
    respond_with(@injury)
  end

  def edit
  end

  def create
    @injury = Injury.new(injury_params)
    @injury.save
    respond_with(@injury)
  end

  def update
    @injury.update(injury_params)
    respond_with(@injury)
  end

  def destroy
    @injury.destroy
    respond_with(@injury)
  end

  private
    def set_injury
      @injury = Injury.find(params[:id])
    end

    def injury_params
      params[:injury]
    end
end
