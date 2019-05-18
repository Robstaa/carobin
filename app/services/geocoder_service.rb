module GeocoderService
  def latitude(address)
    results = Geocoder.search(address)
    results.first.coordinates[0]
  end

  def longitude(address)
    results = Geocoder.search(address)
    results.first.coordinates[1]
  end

  module_function :latitude, :longitude
end