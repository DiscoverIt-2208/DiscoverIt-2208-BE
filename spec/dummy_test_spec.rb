require 'rails_helper'

RSpec.describe 'dummy_test' do
  context 'circleCI initial set-up' do
    it 'checks string is string' do
      expect("this is a test").to be_a(Integer)
    end
  end
end
