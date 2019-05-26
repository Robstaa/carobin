module GeocoderService
  def latitude(address)
    return nil if address.blank?
    
    results = Geocoder.search(address)
    results.first.coordinates[0]
  end
  
  def longitude(address)
    return nil if address.blank?

    results = Geocoder.search(address)
    results.first.coordinates[1]
  end

  module_function :latitude, :longitude
end
