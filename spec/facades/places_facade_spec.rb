require 'rails_helper'

RSpec.describe PlacesFacade do #, :vcr do
  it 'returns places from capital of searched country' do
    city = "Paris"
    country = "France"

    city_info = GeocodingFacade.city_info(city, country)
    hotels = PlacesFacade.hotels(city_info)

    expect(hotels).to be_an Array
    hotels.each do |h|
      expect(h).to be_a Hotel
    end
  end
end