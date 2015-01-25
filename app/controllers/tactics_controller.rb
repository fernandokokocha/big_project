class TacticsController < ApplicationController
  before_action :set_tactic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tactics = Tactic.all
    respond_with(@tactics)
  end

  def show
    respond_with(@tactic)
  end

  def new
    @tactic = Tactic.new
    respond_with(@tactic)
  end

  def edit
  end

  def create
    @tactic = Tactic.new(tactic_params)
    @tactic.save
    respond_with(@tactic)
  end

  def update
    @tactic.update(tactic_params)
    respond_with(@tactic)
  end

  def destroy
    @tactic.destroy
    respond_with(@tactic)
  end

  private
    def set_tactic
      @tactic = Tactic.find(params[:id])
    end

    def tactic_params
      params.require(:tactic).permit(:gk, :d1, :d2, :d3, :d4, :dm1, :dm2, :am1, :am2, :s1, :s2)
    end
end
