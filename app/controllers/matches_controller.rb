class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @matches = Match.all
    respond_with(@matches)
  end

  def show
    respond_with(@match)
  end

  def new
    @match = Match.new
    respond_with(@match)
  end

  def edit
  end

  def create
    respond_to do |format|
      if generate_match_service.call(match_params)
        format.html { redirect_to match_path(Match.last)}
      else
        format.html { render :index }
      end
    end
  end

  def update
    @match.update(match_params)
    respond_with(@match)
  end

  def destroy
    @match.destroy
    respond_with(@match)
  end

  def play_match
    @match = Match.new
  end

  private
    def set_match
      @match = Match.find(params[:id])
    end

    def match_params
      params.require(:match).permit(:home_id, :away_id)
    end

    def generate_match_service
      @generate_match ||= GenerateMatch.new
    end
end
