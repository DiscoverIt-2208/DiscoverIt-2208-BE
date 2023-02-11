class GeocodingFacade
  def self.city_info(city, country)
    GeocodingService.city_info(city, country).first
  end
end
