require 'rails_helper'

RSpec.describe PlacesFacade do # , :vcr do
  let(:city_info) {{ name: 'Paris', latitude: 48.8588897, longitude: 2.3200410217200766, country: 'FR',
    state: 'Ile-de-France' }}
  
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

  context 'pagination' do
    it 'doesnt repeat or exclude results between pages' do
      response = Faraday.get("https://api.geoapify.com/v2/places") do |f|
        f.params['categories'] = 'tourism.sights'
        f.params['bias'] = "proximity:2.3200410217200766,48.8588897"
        f.params['filter'] = "circle:2.3200410217200766,48.8588897,2500"
        f.params['limit'] = '40'
        f.params['apiKey'] = ENV['places_api_key']
      end

      target_fields = %i[name address_line1 address_line2 categories place_id lon lat]

      parsed = JSON.parse(response.body, symbolize_names: true)[:features]
                   .map { |hit| hit[:properties].select { |key, _value| target_fields.include?(key) } }

      page_1 = PlacesFacade.places(city_info, ['tourism.sights'], 0)
      page_2 = PlacesFacade.places(city_info, ['tourism.sights'], 1)

      parsed.each
      expect(page_1).to eq(parsed.take(20))
      expect(page_2).to eq(parsed.last(20))
      expect(page_1.concat(page_2)).to eq(parsed)
    end
  end

  # Old test for auto expanding radius method
  # context 'expanding radius' do
  #   it 'expands the search radius to find 20 results' do
  #     mt_tobin = { longitude: '-117.522539', latitude: '40.374096' }
  #     response = Faraday.get("https://api.geoapify.com/v2/places") do |f|
  #       f.params['categories'] = 'tourism.sights'
  #       f.params['bias'] = "proximity:#{mt_tobin[:longitude]},#{mt_tobin[:latitude]}"
  #       f.params['filter'] = "circle:#{mt_tobin[:longitude]},#{mt_tobin[:latitude]},5000"
  #       f.params['limit'] = '20'
  #       f.params['apiKey'] = ENV['places_api_key']
  #     end

  #     target_fields = %i[name address_line1 address_line2 categories place_id lon lat]

  #     parsed = JSON.parse(response.body, symbolize_names: true)[:features]
  #                  .map { |hit| hit[:properties].select { |key, _value| target_fields.include?(key) } }

  #     expect(parsed.count).to be < 20

  #     full_search = PlacesFacade.places(mt_tobin, ['tourism.sights'])

  #     expect(full_search.count).to be 20
  #   end
  # end
end
