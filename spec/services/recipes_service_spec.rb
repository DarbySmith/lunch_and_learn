require 'rails_helper'

RSpec.describe RecipesService do
  describe 'class methods' do
    describe '#country_recipes' do
      it 'returns recipes for a given country' do
        response = RecipesService.country_recipes("France")

        expect(response).to be_a(Hash)
        expect(response[:hits]).to be_an(Array)
        
        expect(response[:hits][0][:recipe]).to have_key(:url)
        expect(response[:hits][0][:recipe][:url]).to be_a(String)

        expect(response[:hits][0][:recipe]).to have_key(:label)
        expect(response[:hits][0][:recipe][:label]).to be_a(String)

        expect(response[:hits][0][:recipe]).to have_key(:image)
        expect(response[:hits][0][:recipe][:image]).to be_a(String)
      end
    end
  end
end