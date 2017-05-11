class DosesController < ApplicationController
  #before_action :dose_id, only: [:show, :destroy]
  before_action :set_cocktail

  def index
    @doses = Dose.all
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    #@cocktail = @cocktail.dose.destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  def show
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def dose_id
    @dose = Dose.find(params[:id])
  end

end
