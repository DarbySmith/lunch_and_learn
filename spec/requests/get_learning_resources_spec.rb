require 'rails_helper'

RSpec.describe 'get learning resource', :vcr do
  describe 'for a country' do
    it 'return photos and video information' do
      get '/api/v1/learning_resources?country=Peru'

      expect(response).to be_successful

      resource = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(resource[:attributes]).to have_key(:country)
      expect(resource[:attributes][:country]).to be_a(String)

      expect(resource[:attributes]).to have_key(:video)
      expect(resource[:attributes][:video]).to be_a(Hash)

      expect(resource[:attributes]).to have_key(:images)
      expect(resource[:attributes][:images]).to be_a(Array)
    end
  end
end