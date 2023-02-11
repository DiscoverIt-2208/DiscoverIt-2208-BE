require 'rails_helper'

RSpec.describe PlacesFacade do # , :vcr do
  it 'returns places from capital of searched country' do
    city_info = { name: 'Paris', latitude: 48.8588897, longitude: 2.3200410217200766, country: 'FR',
                  state: 'Ile-de-France' }

    places = PlacesFacade.places(city_info)

    expect(places).to be_an Array

    hit = places[0]

    expect(hit).to be_a(Hash)
    expect(hit.keys).to eq(%i[name lon lat address_line1 address_line2 categories place_id])
    expect(hit[:name]).to be_a(String)
    expect(hit[:address_line1]).to be_a(String)
    expect(hit[:address_line2]).to be_a(String)
    expect(hit[:categories]).to be_a(Array)
    expect(hit[:categories][0]).to be_a(String)
    expect(hit[:place_id]).to be_a(String)
    expect(hit[:lat]).to be_a(Float)
    expect(hit[:lon]).to be_a(Float)
  end
end
