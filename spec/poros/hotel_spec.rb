require 'rails_helper'

RSpec.describe Hotel do
  before :each do
    response = File.read('spec/fixtures/hotel_fixture.json')
    data = JSON.parse(response, symbolize_names: true)
    @test_hotel = Hotel.new(data)
  end

  it "exists" do
    expect(@test_hotel).to be_a(Hotel)
  end

  it "has attributes" do
    expect(@test_hotel.name).to eq("Hôtel Méridien Etoile")
    expect(@test_hotel.address).to eq("Hôtel Méridien Etoile, 81 Boulevard Gouvion-Saint-Cyr, 75017 Paris, France")
    expect(@test_hotel.place_id).to eq("51721353b0e148024059b2d5afc392704840f00101f9018d3d13000000000092031748c3b474656c204dc3a972696469656e2045746f696c65")
  end
end