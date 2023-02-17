require 'rails_helper'

RSpec.describe ImageFacade, :vcr do
  it 'get_place_image_url' do
    address = 'Convergence Station - Meow Wolf, 1338 1st Street, Denver, CO 80204, United States of America'
    hit = ImageFacade.get_place_image_url(address)

    expect(hit).to be_an Hash
    expect(hit.keys).to be_in([%i[name photo_reference], [:error_message]])
    expect(hit[:name]).to be_a(String)
    expect(hit[:name]).to eq 'Meow Wolf Denver | Convergence Station'
    expect(hit[:photo_reference]).to be_a(String)
    expect(hit[:photo_reference].include?('https://lh3.googleusercontent.com/places/')).to eq(true)
  end
end
