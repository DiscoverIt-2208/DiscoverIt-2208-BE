require 'rails_helper'

RSpec.describe GoogleService do # , :vcr do
  it '.find_place' do
    address = 'meow wolf denver'
    response = GoogleService.find_place(address, 'photo,name')
    expect(response).to be_a Hash
    expect(response.keys).to eq([:candidates, :status])
    expect(response[:status]).to eq 'OK'
    expect(response[:candidates]).to be_an Array
    hit = response[:candidates].first
    expect(hit[:name]).to eq("Meow Wolf Denver | Convergence Station")
    exepect(hit[:photos]).to be_an Array
    expect(hit[:photos].first[:photo_reference]).to be_a String
  end
end
