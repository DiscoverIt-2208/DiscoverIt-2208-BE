require 'rails_helper'

RSpec.describe GoogleService, :vcr do
  it '.find_place' do
    address = 'meow wolf denver'
    response = GoogleService.find_place(address, 'photo,name')
    expect(response).to be_a Hash
    expect(response.keys).to eq([:candidates, :status])
    expect(response[:status]).to eq 'OK'
    expect(response[:candidates]).to be_an Array
    hit = response[:candidates].first
    expect(hit[:name]).to eq("Meow Wolf Denver | Convergence Station")
    expect(hit[:photos]).to be_an Array
    expect(hit[:photos].first[:photo_reference]).to be_a String
  end

  it '.get_photo_url' do
    address = 'meow wolf denver'
    response = GoogleService.find_place(address, 'photo,name')

    url = GoogleService.get_photo_url(response[:candidates].first[:photos].first[:photo_reference])
    expect(url).to be_a String
    expect(url.include?('https://lh3.googleusercontent.com/places/')).to eq(true)
  end
end
