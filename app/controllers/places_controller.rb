class PlacesController < ApplicationController
  def new
    @place = Place.new
    @center = CenterService
    @place.visits.build
  end

  def create
    @place = Place.new place_params
    @place.visits.build(date: params[:visits][:date], notes: params[:visits][:notes])
    @place.longitude = GeocoderService.longitude(params[:place][:location])
    @place.latitude = GeocoderService.latitude(params[:place][:location])

    if @place.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def place_params
    params.require(:place)
          .permit(
            :name, :location, :latitude, :longitude, :rating, visit_attributes: [:date, :notes])
  end
end
