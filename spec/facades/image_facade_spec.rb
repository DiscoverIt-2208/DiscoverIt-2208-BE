require 'rails_helper'

RSpec.describe ImageFacade do # , :vcr do
  it 'get_place_image_ref' do
    address = 'Convergence Station - Meow Wolf, 1338 1st Street, Denver, CO 80204, United States of America'

    hit = ImageFacade.get_place_image_ref(address)

    expect(hit).to be_an Hash
    expect(hit.keys).to eq(%i[name photo_reference])
    expect(hit[:name]).to be_a(String)
    expect(hit[:name]).to eq "Meow Wolf Denver | Convergence Station"
    expect(hit[:photo_reference]).to be_a(String)
  end
end