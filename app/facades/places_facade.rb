class PlacesFacade
  def self.hotels(city_info)

    hotels = PlacesService.get_hotels(city_info)
    # require "pry"; binding.pry
    locations = hotels.map do |p|
      Hotel.new(p)
    end
  end
end
