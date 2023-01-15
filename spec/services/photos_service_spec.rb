require 'rails_helper'

RSpec.describe PhotosService do
  describe 'class methods' do
    describe '#find_photos' do
      it 'finds 10 photos for the given country' do
        response = PhotosService.find_photos("Peru")

        expect(response).to be_a(Hash)
        photo = response[:results][0]

        expect(photo).to have_key(:alt_description)
        expect(photo[:alt_description]).to be_a(String)
        
        expect(photo).to have_key(:urls)
        expect(photo[:urls]).to have_key(:regular)
        expect(photo[:urls][:regular]).to be_a(String)
      end
    end
  end
end