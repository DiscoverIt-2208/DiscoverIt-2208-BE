module Queries
  class FetchPlaces < Queries::BaseQuery
    type [Types::PlaceType], null: true

    argument :city, String, required: true
    argument :country, String, required: true
    argument :categories, [String], required: false, default_value: nil
    argument :page, Integer, required: false, default_value: 0
    argument :radius, Integer, required: false, default_value: 2500

    def resolve(args)
      city_info = GeocodingFacade.city_info(args[:city], args[:country])
      places = PlacesFacade.places(city_info, args[:categories], args[:page], args[:radius])

      places.each_with_object([]) do |place, array|
        array << {
          'name' => place[:name].presence || place[:formatted],
          'address' => place[:formatted],
          'categories' => place[:categories],
          'place_id' => place[:place_id],
          'city' => city_info[:city], 'country' => city_info[:country],
          'lat' => place[:lat], 'lon' => place[:lon],
          'photo_reference' => place[:image_data][:photo_reference]
        }
      end
    end
  end
end
