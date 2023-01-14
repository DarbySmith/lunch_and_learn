require 'rails_helper'

RSpec.describe Recipe do
  describe 'initialize' do
    it 'exists' do
      attributes = {
        label: "Edamame",
        image: "www.image.com",
        url: "www.source_recipe.com"
      }

      country = "japan"

      recipe = Recipe.new(country, attributes)

      expect(recipe).to be_instance_of(Recipe)
      expect(recipe.title).to eq("Edamame")
      expect(recipe.url).to eq("www.source_recipe.com")
      expect(recipe.country).to eq("Japan")
      expect(recipe.image).to eq("www.image.com")
    end
  end
end