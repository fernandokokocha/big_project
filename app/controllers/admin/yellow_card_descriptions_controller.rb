class Admin::YellowCardDescriptionsController < ApplicationController
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
    @yellow_card_descriptions = YellowCardDescription.all
  end

  def show
  end

  def new
    @yellow_card_description = YellowCardDescription.new
  end

  def edit
  end

  def create
    @yellow_card_description = YellowCardDescription.new(yellow_card_description_params)
    respond_to do |format|
      if @yellow_card_description.save
        format.html { redirect_to admin_yellow_card_descriptions_path, notice: 'YellowCard description was successfully created.' }
        format.json { render :show, status: :created, location: @yellow_card_description }
      else
        format.html { render :new }
        format.json { render json: @yellow_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @yellow_card_description.update(yellow_card_description_params)
        format.html { redirect_to admin_yellow_card_descriptions_path, notice: 'Yellow Card description was successfully updated.' }
        format.json { render :show, status: :ok, location: @yellow_card_description }
      else
        format.html { render :edit }
        format.json { render json: @yellow_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @yellow_card_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_yellow_card_descriptions_path, notice: 'Yellow Card description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @yellow_card_description = YellowCardDescription.find(params[:id])
  end

  def yellow_card_description_params
    params.require(:yellow_card_description).permit(:description)
  end
end