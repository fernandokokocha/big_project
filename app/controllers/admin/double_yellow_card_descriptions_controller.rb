class Admin::DoubleYellowCardDescriptionsController < ApplicationController
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
    @double_yellow_card_descriptions = DoubleYellowCardDescription.all
  end

  def show
  end

  def new
    @double_yellow_card_description = DoubleYellowCardDescription.new
  end

  def edit
  end

  def create
    @double_yellow_card_description = DoubleYellowCardDescription.new(double_yellow_card_description_params)
    respond_to do |format|
      if @double_yellow_card_description.save
        format.html { redirect_to admin_double_yellow_card_descriptions_path, notice: 'Double Yellow Card description was successfully created.' }
        format.json { render :show, status: :created, location: @double_yellow_card_description }
      else
        format.html { render :new }
        format.json { render json: @double_yellow_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @double_yellow_card_description.update(double_yellow_card_description_params)
        format.html { redirect_to admin_double_yellow_card_descriptions_path, notice: 'Double Yellow Card description was successfully updated.' }
        format.json { render :show, status: :ok, location: @double_yellow_card_description }
      else
        format.html { render :edit }
        format.json { render json: @double_yellow_card_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @double_yellow_card_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_double_yellow_card_descriptions_path, notice: 'DoubleYellowCard description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @double_yellow_card_description = DoubleYellowCardDescription.find(params[:id])
  end

  def double_yellow_card_description_params
    params.require(:double_yellow_card_description).permit(:description)
  end
end