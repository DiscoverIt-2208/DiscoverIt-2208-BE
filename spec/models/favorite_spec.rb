require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of :place_id }
    it { should validate_presence_of :place_name }
    it { should allow_value("", nil).for(:thumbnail_url)}
    it { should validate_presence_of :city }
    it { should validate_presence_of :country }
    it { should validate_presence_of :address }
    it { should allow_value("", nil).for(:state) }
  end
end
