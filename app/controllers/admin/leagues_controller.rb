class Admin::LeaguesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action do
    unless current_user && current_user.admin?
      flash[:alert] = 'Secured!'
      redirect_to root_path
    end
  end

  respond_to :html

  def index
    @leagues = League.all
  end

  def show
  end

  def new
    @league = League.new
  end

  def edit
  end

  def create
    @league = League.new(league_params)
    respond_to do |format|
      if @league.save
        format.html { redirect_to admin_leagues_path, notice: 'League was successfully created.' }
        format.json { render :show, status: :created, location: @league }
      else
        format.html { render :new }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @league.update(league_params)
        format.html { redirect_to admin_leagues_path, notice: 'League was successfully updated.' }
        format.json { render :show, status: :ok, location: @league }
      else
        format.html { render :edit }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @league.destroy
    respond_to do |format|
      format.html { redirect_to admin_leagues_path, notice: 'League was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @league = League.find(params[:id])
  end

  def league_params
    params.require(:league).permit(:name, :win_points, :draw_points, :win_price, :draw_price, :top_scorer_price, :best_assistant_price)
  end
end