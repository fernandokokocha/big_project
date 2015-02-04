class Admin::RedCardDescriptionsController < ApplicationController
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
    @red_card_descriptions = RedCardDescription.all
  end

  def show
  end

  def new
    @red_card_description = RedCardDescription.new
  end

  def edit
  end

  def create
    @red_card_description = RedCardDescription.new(red_card_description_params)
    respond_to do |format|
      if @red_card_description.save
        format.html { redirect_to admin_red_card_descriptions_path, notice: 'RedCard description was successfully created.' }
        format.json { render :show, status: :created, location: @red_card_description }
      else
        format.html { render :new }
        format.json { render json: @red_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @red_card_description.update(red_card_description_params)
        format.html { redirect_to admin_red_card_descriptions_path, notice: 'Red Card description was successfully updated.' }
        format.json { render :show, status: :ok, location: @red_card_description }
      else
        format.html { render :edit }
        format.json { render json: @red_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @red_card_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_red_card_descriptions_path, notice: 'Red Card description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @red_card_description = RedCardDescription.find(params[:id])
  end

  def red_card_description_params
    params.require(:red_card_description).permit(:description)
  end
end