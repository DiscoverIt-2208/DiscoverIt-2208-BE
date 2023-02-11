
module Queries
  class FetchHotels < Queries::BaseQuery
    type [Types::HotelType], null: true

    argument :city, String, required: true
    argument :country, String, required: true

    #Astrid: refactor using reduce
    def resolve(args)
      response = []
      city_info = GeocodingFacade.city_info(args[:city], args[:country])
      hotels = PlacesFacade.hotels(city_info)

      hotels.each do |hotel|
        response << {
        "name" => hotel.name, "address" => hotel.address, "place_id" => hotel.place_id, "city" => city_info.city, "country" => city_info.country
        }
      end

      response
    end
  end
end