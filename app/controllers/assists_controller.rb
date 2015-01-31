class AssistsController < ApplicationController
  before_action :set_assist, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @assists = Assist.all
    respond_with(@assists)
  end

  def show
    respond_with(@assist)
  end

  def new
    @assist = Assist.new
    respond_with(@assist)
  end

  def edit
  end

  def create
    @assist = Assist.new(assist_params)
    @assist.save
    respond_with(@assist)
  end

  def update
    @assist.update(assist_params)
    respond_with(@assist)
  end

  def destroy
    @assist.destroy
    respond_with(@assist)
  end

  private
    def set_assist
      @assist = Assist.find(params[:id])
    end

    def assist_params
      params[:assist]
    end
end
