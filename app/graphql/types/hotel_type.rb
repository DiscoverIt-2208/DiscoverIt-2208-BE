# frozen_string_literal: true

module Types
  class HotelType < Types::BaseObject
    field :name, String
    field :address, String
    field :place_id, String
    field :city, String
    field :country, String
  end
end