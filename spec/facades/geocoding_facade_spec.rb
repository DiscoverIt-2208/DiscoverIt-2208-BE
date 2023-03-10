require 'rails_helper'

RSpec.describe GeocodingFacade, :vcr do
  it '.capital_info' do
    city_name = 'Paris'
    country = 'France'
    city = GeocodingFacade.city_info(city_name, country)
    expect(city).to be_a(Hash)
  end
end

