class PlacesController < ApplicationController
  def new
    @place = Place.new
    @place.visits.build
    @place.visits.build.vines.build
    @center = CenterService
  end

  def create
    @place = Place.new place_params
    @place.longitude = place_longitude
    @place.latitude = place_latitude
    build_visit_and_vine


    if @place.save
      flash[:success] = "#{@place.name} wurde erfolgreich erstellt!"
      redirect_to place_path(@place)
    else
      flash[:alert] = error_messages
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
    @visits = Visit.where(place_id: @place.id)
    @vines = Vine.where(visit_id: @visits.ids)
    @markers = Place.all.to_json.html_safe
  end

  private

  def error_messages
    @place.errors.full_messages.join('<br>')
  end

  def build_visit_and_vine
    visit = @place.visits.build(visit_params) if visit_params['date'].present?
    visit.vines.build(vine_params) if vine_params['name'].present?
  end

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
    return visit_params_without_images if params[:visits][:images] == ['']

    visit_params_with_images
  end

  def visit_params_without_images
    {
      date: params[:visits][:date],
      notes: params[:visits][:notes],
    }
  end

  def visit_params_with_images
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
