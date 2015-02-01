class MatchEventsController < ApplicationController
  before_action :set_match_event, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @match_events = MatchEvent.all
    respond_with(@match_events)
  end

  def show
    respond_with(@match_event)
  end

  def new
    @match_event = MatchEvent.new
    respond_with(@match_event)
  end

  def edit
  end

  def create
    @match_event = MatchEvent.new(match_event_params)
    @match_event.save
    respond_with(@match_event)
  end

  def update
    @match_event.update(match_event_params)
    respond_with(@match_event)
  end

  def destroy
    @match_event.destroy
    respond_with(@match_event)
  end

  private
    def set_match_event
      @match_event = MatchEvent.find(params[:id])
    end

    def match_event_params
      params.require(:match_event).permit(:type, :time, :description)
    end
end
