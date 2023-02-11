require 'rails_helper'

RSpec.describe City do
  it 'exists and has attributes' do
    capital_info = {
                        :name=>"Abuja",
                        :latitude=>9.0643305,
                        :longitude=>7.4892974,
                        :country=>"NG",
                        :state=>"Federal Capital Territory"
                    }
    country = "Nigeria"

    capital = City.new(capital_info,country)

    expect(capital).to be_an_instance_of(City)
    expect(capital.city).to eq("Abuja")
    expect(capital.latitude).to eq(9.0643305)
    expect(capital.longitude).to eq(7.4892974)
    expect(capital.country_code).to eq("NG")
  end
end