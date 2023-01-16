require 'rails_helper'

RSpec.describe LearningResourceFacade, :vcr do
  describe 'class methods' do
    describe '#country_resource' do
      it 'returns information for the country' do
        response = LearningResourceFacade.country_resource("Peru")

        expect(response).to be_instance_of(LearningResource)
        expect(response.country).to eq("Peru")
        expect(response.video).to be_a(Hash)
        expect(response.images).to be_an(Array)
      end
    end
  end
end