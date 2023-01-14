require 'rails_helper'

RSpec.describe CountriesService do
  describe 'class methods' do
    describe 'all_countries' do
      it 'returns all countries' do
        response = CountriesService.random_country

        expect(response).to be_a(Hash)

        expect(response[:name]).to have_key(:common)
        expect(response[:name][:common]).to be_a(String)
      end
    end
  end
end