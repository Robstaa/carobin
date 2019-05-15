class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    @place = Place.new place_params

    if @place.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end
end
