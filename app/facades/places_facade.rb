class PlacesFacade
  def self.hotels(city_info)

    hotels = PlacesService.get_hotels(city_info)
    locations = hotels.map do |hotel|
      Hotel.new(hotel)
    end
  end
end