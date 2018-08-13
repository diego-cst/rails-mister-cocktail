class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to(new_cocktail_dose_path(@cocktail))
    else
      render(:new)
    end
  end

  def new
    @cocktail = Cocktail.new()
  end

  def top
    @cocktails = Cocktail.joins(:reviews).where('stars > 2')
  end

private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
