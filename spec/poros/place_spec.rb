RSpec.describe Place do
  before :each do
    data = { type: 'Feature',
             properties: { name: 'Hôtel Méridien Etoile',
                           country: 'France',
                           country_code: 'fr',
                           region: 'Metropolitan France',
                           state: 'Ile-de-France',
                           city: 'Paris',
                           postcode: '75017',
                           district: 'Paris',
                           suburb: '17th Arrondissement',
                           city_block: 'Quartier des Ternes',
                           street: 'Boulevard Gouvion-Saint-Cyr',
                           housenumber: '81',
                           lon: 2.2853816492180723,
                           lat: 48.879540250000005,
                           formatted: 'Hôtel Méridien Etoile, 81 Boulevard Gouvion-Saint-Cyr, 75017 Paris, France',
                           address_line1: 'Hôtel Méridien Etoile',
                           address_line2: '81 Boulevard Gouvion-Saint-Cyr, 75017 Paris, France',
                           categories: ['accommodation', 'accommodation.hotel', 'building', 'building.accommodation', 'wheelchair',
                                        'wheelchair.yes'],
                           details: ['details', 'details.building', 'details.contact', 'details.facilities',
                                     'details.wiki_and_media'],
                           datasource: { sourcename: 'openstreetmap',
                                         attribution: '© OpenStreetMap contributors',
                                         license: 'Open Database Licence',
                                         url: 'https://www.openstreetmap.org/copyright',
                                         raw: { ref: 'PARMD',
                                                name: 'Hôtel Méridien Etoile',
                                                phone: '+33 1 40 68 34 34',
                                                osm_id: -1_260_941,
                                                tourism: 'hotel',
                                                website: 'http://lemeridien.com/etoile',
                                                building: 'hotel',
                                                osm_type: 'r',
                                                wikidata: 'Q3224950',
                                                "addr:city": 'Paris',
                                                wheelchair: 'yes',
                                                "addr:street": 'Boulevard Gouvion-Saint-Cyr',
                                                "addr:postcode": 75_017,
                                                "building:levels": 11,
                                                "addr:housenumber": 81 } },
                           place_id: '51721353b0e148024059b2d5afc392704840f00101f9018d3d13000000000092031748c3b474656c204dc3a972696469656e2045746f696c65' },
             geometry: { type: 'Point', coordinates: [2.2855867171623965, 48.87947889409715] } }

    @test_hotel = Place.new(data)
  end

  it 'exists' do
    expect(@test_hotel).to be_a(Place)
  end

  it 'has attributes' do
    expect(@test_hotel.name).to eq('Hôtel Méridien Etoile')
    expect(@test_hotel.address).to eq('Hôtel Méridien Etoile, 81 Boulevard Gouvion-Saint-Cyr, 75017 Paris, France')
    expect(@test_hotel.place_id).to eq('51721353b0e148024059b2d5afc392704840f00101f9018d3d13000000000092031748c3b474656c204dc3a972696469656e2045746f696c65')
  end
end
