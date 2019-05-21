class PlacesController < ApplicationController
  def new
    @place = Place.new
    @place.visits.build
    @place.visits.build.vines.build
    @center = CenterService
  end

  def create
    @place = Place.new place_params
    visit = @place.visits.build(visit_params)
    visit.vines.build(vine_params)
    @place.longitude = place_longitude
    @place.latitude = place_latitude

    if @place.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @place = Place.find(params[:id])
    @visits = Visit.where(place_id: @place.id)
    @vines = Vine.where(visit_id: @visits.ids)
    @markers = Place.all.to_json.html_safe
  end

  private

  def place_params
    params.require(:place)
          .permit(
            :name, :location, :latitude, :longitude, :rating,
            visit_attributes: [:date, :notes, images: []],
            vine_attributes: [:name, :rating]
          )
  end

  def vine_params
    {
      name: params[:vines][:name],
      rating: params[:vines][:rating]
    }
  end

  def visit_params
    {
      date: params[:visits][:date],
      notes: params[:visits][:notes],
      images: params[:visits][:images]
    }
  end

  def place_longitude
    GeocoderService.longitude(params[:place][:location])
  end

  def place_latitude
    GeocoderService.latitude(params[:place][:location])
  end
end
