require 'rails_helper'

RSpec.describe Country do
  describe 'initialize' do
    it 'exists' do
      attributes = {
        common: 'Samoa'
      }

      country = Country.new(attributes)

      expect(country).to be_instance_of(Country)
      expect(country.name).to eq("Samoa")
    end
  end
end