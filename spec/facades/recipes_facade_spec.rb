require 'rails_helper'

RSpec.describe RecipesFacade, :vcr do
  describe 'class methods' do
    describe '#country_recipes' do
      it 'creates array of recipes for that country' do
        response = RecipesFacade.country_recipes("France")

        expect(response).to be_an(Array)
        expect(response[0]).to be_instance_of(Recipe)
        expect(response[0].title).to_not eq(nil)
        expect(response[0].url).to_not eq(nil)
        expect(response[0].country).to_not eq(nil)
        expect(response[0].image).to_not eq(nil)
      end
    end
  end
end