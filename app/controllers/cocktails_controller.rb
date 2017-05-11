class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    @cocktail.save
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @dose = Dose.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.includes(doses: :ingredient).find(params[:id])
  end

end
