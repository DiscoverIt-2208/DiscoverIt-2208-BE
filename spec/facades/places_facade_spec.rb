require 'rails_helper'

RSpec.describe PlacesFacade, :vcr do
  let(:city_info) do
    { name: 'Paris', latitude: 48.8588897, longitude: 2.3200410217200766, country: 'FR',
      state: 'Ile-de-France' }
  end

  # context 'pagination' do
    # it 'doesnt repeat or exclude results between pages' do
    #   response = Faraday.get('https://api.geoapify.com/v2/places') do |f|
    #     f.params['categories'] = 'tourism.sights'
    #     f.params['bias'] = 'proximity:2.3200410217200766,48.8588897'
    #     f.params['filter'] = 'circle:2.3200410217200766,48.8588897,2500'
    #     f.params['limit'] = '40'
    #     f.params['apiKey'] = ENV['places_api_key']
    #   end

  #     target_fields = %i[name formatted categories place_id lon lat]

  #     parsed = JSON.parse(response.body, symbolize_names: true)[:features]
  #                  .map { |hit| hit[:properties].select { |key, _value| target_fields.include?(key) } }

  #     page_1 = PlacesFacade.places(city_info, ['tourism.sights'], 0).map do |hit|
  #       hit.reject do |k, _v|
  #         k == :image_data
  #       end
  #     end
  #     page_2 = PlacesFacade.places(city_info, ['tourism.sights'], 1).map do |hit|
  #       hit.reject do |k, _v|
  #         k == :image_data
  #       end
  #     end

  #     parsed.each
  #     expect(page_1).to eq(parsed.take(20))
  #     expect(page_2).to eq(parsed.last(20))
  #     expect(page_1.concat(page_2)).to eq(parsed)
  #   end
  # end

  context 'google methods' do
    describe ' - happy path - ' do
      describe '.places w/o categories (landing page)' do
        it 'returns places from location in proper format' do
          places = PlacesFacade.places(city_info)

          expect(places).to be_an Array

          hit = places[0]

          expect(hit).to be_a(Hash)
          expect(hit.keys).to include(:name, :lon, :lat, :formatted, :categories, :place_id, :image_data, :next_page_token)
          expect(hit[:name]).to be_a(String)
          expect(hit[:formatted]).to be_a(String)
          expect(hit[:categories]).to be_a(Array)
          expect(hit[:categories][0]).to be_a(String)
          expect(hit[:place_id]).to be_a(String)
          expect(hit[:image_data]).to be_a Hash
          expect(hit[:image_data].keys).to eq(%i[name photo_reference])
          expect(hit[:next_page_token]).to be_a String
          expect(hit[:image_data][:name]).to be_a(String)
          expect(hit[:image_data][:photo_reference]).to be_a(String)
          expect(hit[:lat]).to be_a(Float)
          expect(hit[:lon]).to be_a(Float)
        end

        it 'can paginate and still returns places from location in proper format' do
          places_pg1 = PlacesFacade.places(city_info)
          places_pg2 = PlacesFacade.places(city_info, page_token: places_pg1.first[:next_page_token])

          expect(places_pg2).to be_an Array

          first_page_hit = places_pg1.first
          second_page_hit = places_pg2.first

          expect(places_pg1).to_not include(second_page_hit)
          expect(places_pg2).to_not include(first_page_hit)

        end
      end

      describe 'places w/ categories' do
        it 'returns new places that match the categories' do
          places = PlacesFacade.places(city_info, categories: ['restaurants'])
          expect(places).to be_an Array

          hit = places[0]

          expect(hit).to be_a(Hash)
          expect(hit.keys).to include(:name, :lon, :lat, :formatted, :categories, :place_id, :image_data, :next_page_token)
          expect(hit[:name]).to be_a(String)
          expect(hit[:formatted]).to be_a(String)
          expect(hit[:categories]).to be_a(Array)
          expect(hit[:categories][0]).to be_a(String)
          expect(hit[:place_id]).to be_a(String)
          expect(hit[:image_data]).to be_a Hash
          expect(hit[:image_data].keys).to eq(%i[name photo_reference])
          expect(hit[:next_page_token]).to be_a String
          expect(hit[:image_data][:name]).to be_a(String)
          expect(hit[:image_data][:photo_reference]).to be_a(String)
          expect(hit[:lat]).to be_a(Float)
          expect(hit[:lon]).to be_a(Float)
        end
      end
    end

    describe ' - sad path - ' do
      describe 'can still correctly .places with shared international names' do
        it 'returns places from location in proper format' do
          city_info = GeocodingFacade.city_info("Paris", "USA")
          places = PlacesFacade.places(city_info)

          expect(places).to be_an Array

          hit = places[0]

          expect(hit).to be_a(Hash)
          expect(hit.keys).to include(:name, :lon, :lat, :formatted, :categories, :place_id, :image_data, :next_page_token)
          expect(hit[:name].include?("TX"))
        end
      end
    end
  end

  # context 'geoapify methods' do
  #   describe '.get_places with category' do
  #     it 'returns places from location' do
  #       places = PlacesFacade.places(city_info, categories: ['tourism sights'])

  #       expect(places).to be_an Array

  #       hit = places[0]

  #       expect(hit).to be_a(Hash)
  #       expect(hit.keys).to eq(%i[name lon lat formatted categories place_id image_data])
  #       expect(hit[:name]).to be_a(String)
  #       expect(hit[:formatted]).to be_a(String)
  #       expect(hit[:categories]).to be_a(Array)
  #       expect(hit[:categories][0]).to be_a(String)
  #       expect(hit[:place_id]).to be_a(String)
  #       expect(hit[:image_data]).to be_a Hash
  #       expect(hit[:image_data].keys).to eq(%i[name photo_reference])
  #       expect(hit[:image_data][:name]).to be_a(String)
  #       expect(hit[:image_data][:photo_reference]).to be_a(String)
  #       expect(hit[:lat]).to be_a(Float)
  #       expect(hit[:lon]).to be_a(Float)
  #     end

  #     it 'doesnt repeat or exclude results between pages' do
  #       response = Faraday.get('https://api.geoapify.com/v2/places') do |f|
  #         f.params['categories'] = 'tourism.sights'
  #         f.params['bias'] = 'proximity:2.3200410217200766,48.8588897'
  #         f.params['filter'] = 'circle:2.3200410217200766,48.8588897,2500'
  #         f.params['limit'] = '40'
  #         f.params['apiKey'] = ENV['places_api_key']
  #       end

  #       target_fields = %i[name formatted categories place_id lon lat]

  #       parsed = JSON.parse(response.body, symbolize_names: true)[:features]
  #                    .map { |hit| hit[:properties].select { |key, _value| target_fields.include?(key) } }

  #       page_1 = PlacesFacade.places(city_info, ['tourism sights'], 0).map do |hit|
  #         hit.reject do |k, _v|
  #           k == :image_data
  #         end
  #       end
  #       page_2 = PlacesFacade.places(city_info, ['tourism sights'], 1).map do |hit|
  #         hit.reject do |k, _v|
  #           k == :image_data
  #         end
  #       end

  #       parsed.each
  #       expect(page_1).to eq(parsed.take(20))
  #       expect(page_2).to eq(parsed.last(20))
  #       expect(page_1.concat(page_2)).to eq(parsed)
  #     end
  #   end

  #   describe '.get_detailed_information' do
  #     it 'returns details for a specific place based off id' do
  #       city_info = { name: 'Olympia', latitude: 47.038360820746234, longitude: -122.93770133659231, country: 'US',
  #                     state: 'Washington' }

  #       places = PlacesFacade.places(city_info, categories: ['sport fitness'])

  #       hit = places[0]
  #       id = hit[:place_id]
  #       details = PlacesFacade.get_detailed_information(id)

  #       expect(details).to have_key(:name)
  #       expect(details[:name]).to eq('Planet Fitness')
  #     end
  #   end
  # end

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
