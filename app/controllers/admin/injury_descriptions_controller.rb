class Admin::InjuryDescriptionsController < ApplicationController
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
    @injury_descriptions = InjuryDescription.all
  end

  def show
  end

  def new
    @injury_description = InjuryDescription.new
  end

  def edit
  end

  def create
    @injury_description = InjuryDescription.new(injury_description_params)
    respond_to do |format|
      if @injury_description.save
        format.html { redirect_to admin_injury_descriptions_path, notice: 'Injury description was successfully created.' }
        format.json { render :show, status: :created, location: @injury_description }
      else
        format.html { render :new }
        format.json { render json: @injury_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @injury_description.update(injury_description_params)
        format.html { redirect_to admin_injury_descriptions_path, notice: 'Injury description was successfully updated.' }
        format.json { render :show, status: :ok, location: @injury_description }
      else
        format.html { render :edit }
        format.json { render json: @injury_description.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @injury_description.destroy
    respond_to do |format|
      format.html { redirect_to admin_injury_descriptions_path, notice: 'Injury description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @injury_description = InjuryDescription.find(params[:id])
  end

  def injury_description_params
    params.require(:injury_description).permit(:description)
  end
end