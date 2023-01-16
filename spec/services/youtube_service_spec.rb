require 'rails_helper'

RSpec.describe YoutubeService, :vcr do
  describe 'class methods' do
    describe '#find_video' do
      it 'returns video for that country' do
        response = YoutubeService.find_video("China")

        expect(response).to be_a(Hash)
        expect(response).to have_key(:items)

        video = response[:items][0]
        expect(video[:id]).to have_key(:videoId)
        expect(video[:id][:videoId]).to be_a(String)

        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)
      end
    end
  end
end