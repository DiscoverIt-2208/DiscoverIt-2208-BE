require 'rails_helper'

RSpec.describe GeocodingService, :vcr do
  it '.capital_info' do
    city_name = 'Paris'
    country = 'France'
    response = GeocodingService.city_info(city_name, country)
    expect(response).to be_a Array

    expect(response.first).to be_a Hash
    expect(response.first).to have_key :name
    expect(response.first).to have_key :latitude
    expect(response.first).to have_key :longitude
    expect(response.first).to have_key :country
  end
end
