module Queries
    class FetchPlaces < Queries::BaseQuery
      type Types::FetchPlacesType, null: true
  
      argument :city, String, required: true
      argument :country, String, required: true
  
      def resolve(args)
        city_info = GeocodingFacade.city_info(args[:city], args[:country])
  
        {"city" => city_info.city, "country" => city_info.country, "country_code" => city_info.country_code, "latitude" => city_info.latitude, "longitude" => city_info.longitude}
  
      end
    end
end