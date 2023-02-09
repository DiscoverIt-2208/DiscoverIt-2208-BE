module Types 
  class FetchPlacesType < Types::BaseObject 
    field :city, String, required: true
    field :country, String
    field :country_code, String
    field :latitude, String
    field :longitude, String
  end
end
