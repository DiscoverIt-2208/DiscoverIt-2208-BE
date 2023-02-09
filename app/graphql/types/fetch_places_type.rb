module Types 
  class FetchPlacesType < Types::BaseObject 
    field :city, String
    field :country, String
    field :country_code, String
    field :latitude, String
    field :longitude, String
  end
end