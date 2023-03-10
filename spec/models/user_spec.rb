require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:favorites) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'instance methods - ' do
    it 'standardizes email to save as lowercase' do
      user = User.new(name: "Bob", email: "BoBsCaPiTaL_LeTTeRS@gMAIl.coM", password: "password")
      expect(user.email).to eq('bobscapital_letters@gmail.com')
    end
  end
end
