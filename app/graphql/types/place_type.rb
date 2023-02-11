# frozen_string_literal: true

module Types
  class PlaceType < Types::BaseObject
    field :name, String
    field :address, String
    field :categories, [String]
    field :place_id, String
    field :city, String
    field :country, String
    field :lat, Float
    field :lon, Float
  end
end
