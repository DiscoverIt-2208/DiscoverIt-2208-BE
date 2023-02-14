require 'rails_helper'

describe GeoapifyService do # , :vcr do
  it '.get_city_places' do
    city_info = { name: 'Paris', latitude: 48.8588897, longitude: 2.3200410217200766, country: 'FR',
                  state: 'Ile-de-France' }

    places = GeoapifyService.get_city_places(city_info)[:features]

    expect(places).to be_an Array
    expect(places.count).to eq(20)

    hit = places[0]

    expect(hit).to be_a(Hash)
    expect(hit.keys).to eq(%i[type properties geometry])
    prop = hit[:properties]
    expect(prop[:city]).to be_a(String)
    expect(prop[:country]).to eq("France")
    expect(prop[:name]).to be_a(String)
    expect(prop[:lon]).to be_a(Float)
    expect(prop[:lat]).to be_a(Float)
    expect(prop[:address_line1]).to be_a(String)
    expect(prop[:address_line2]).to be_a(String)
    expect(prop[:categories]).to be_a(Array)
    expect(prop[:categories][0]).to be_a(String)
    expect(prop[:place_id]).to be_a(String)
  end
end
