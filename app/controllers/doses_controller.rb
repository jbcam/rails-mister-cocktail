class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to new_dose_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:amount, :description)
  end
end
