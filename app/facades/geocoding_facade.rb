class GeocodingFacade
  def self.city_info(city, country)
    city_data = GeocodingService.city_info(city,country).first
    City.new(city_data, country)
  end
end