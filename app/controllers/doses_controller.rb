class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail, notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to @dose.cocktail, notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to @cocktail, notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
