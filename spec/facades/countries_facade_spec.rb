require 'rails_helper'

RSpec.describe CountriesFacade, :vcr do
  describe 'class methods' do
    describe '#random_country' do
      it 'creates a country object from a randomly selected country' do
        country = CountriesFacade.random_country

        expect(country).to be_instance_of(Country)
        expect(country.name).to_not eq(nil)
      end
    end
  end
end