# frozen_string_literal: true

module Types
  class PlaceType < Types::BaseObject
    field :name, String
    field :address, String
    field :categories, [String]
    field :place_id, String
    field :city, String
    field :state, String, null: true
    field :country, String
    field :lat, Float, null: true
    field :lon, Float, null: true
    field :phone, String, null: true
    field :hours, String, null: true
    field :website, String, null: true
    field :image_data, String
  end
end
