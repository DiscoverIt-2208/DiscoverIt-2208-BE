module Queries
  class FetchPlaces < Queries::BaseQuery
    type [Types::PlaceType], null: true

    argument :city, String, required: true
    argument :country, String, required: true
    argument :categories, [String], required: false, default_value: nil
    argument :page_token, String, required: false, default_value: nil
    argument :search_type, String, required: false, default_value: "google"
    argument :search_radius, Integer, required: false, default_value: 2500

    def resolve(args)
      city_info = GeocodingFacade.city_info(args.delete(:city), args.delete(:country))
      places = PlacesFacade.places(city_info, **args)

      hits = places.each_with_object([]) do |place, array|
        array << {
          'name' => place[:name].presence || place[:formatted],
          'address' => place[:formatted],
          'categories' => place[:categories],
          'place_id' => place[:place_id],
          'city' => city_info[:city], 'country' => city_info[:country],
          'lat' => place[:lat], 'lon' => place[:lon],
          'image_data' => place[:image_data],
          'next_page_token' => place[:next_page_token]
        }
      end
    end
  end
end
