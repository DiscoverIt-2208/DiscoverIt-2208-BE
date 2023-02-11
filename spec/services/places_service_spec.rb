require 'rails_helper'

describe PlacesService do
  it '.get_hotels' do
    city = "Paris"
    country = "France"

    capital_info = GeocodingFacade.city_info(city,country)
    hotels = PlacesService.get_hotels(capital_info)
    
    hotels.each do |hotel|
      expect(hotel.keys).to eq([:type, :properties, :geometry])
      expect(hotel[:properties]).to have_key(:name)
      expect(hotel[:properties]).to have_key(:formatted)
      expect(hotel[:properties]).to have_key(:place_id)
      expect(hotel[:properties][:name]).to be_a String
      expect(hotel[:properties][:formatted]).to be_a String
      expect(hotel[:properties][:place_id]).to be_a String
    end
  end
end