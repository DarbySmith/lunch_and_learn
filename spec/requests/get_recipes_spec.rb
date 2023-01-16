require 'rails_helper'

RSpec.describe 'get recipes for a country', :vcr do
  it 'returns recipes for a country' do
    get '/api/v1/recipes?country=thailand'

    expect(response).to be_successful

    recipe = JSON.parse(response.body, symbolize_names: true)[:data][0]
    expect(recipe[:attributes]).to have_key(:title)
    expect(recipe[:attributes][:title]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:url)
    expect(recipe[:attributes][:url]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:country)
    expect(recipe[:attributes][:country]).to be_a(String)

    expect(recipe[:attributes]).to have_key(:image)
    expect(recipe[:attributes][:image]).to be_a(String)

    expect(recipe[:attributes]).to_not have_key(:uri)
    expect(recipe[:attributes]).to_not have_key(:ingredients)
    expect(recipe[:attributes]).to_not have_key(:calories)
  end

  it 'returns recipes for a random country if one is not selected' do
    VCR.eject_cassette
    VCR.turned_off do
      country_body = File.read("spec/fixtures/random_country_response.json")

      stub_request(:get, "https://restcountries.com/v3.1/all?fields=name")
        .to_return(status: 200, body: country_body, headers: {})
      
      recipe_body = File.read("spec/fixtures/recipes_japan_response.json")
      
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=bca3f4c0&app_key=19d45876bfbcc0439f8e27b6b66a263a&q=Grenada&type=public")
        .to_return(status: 200, body: recipe_body, headers: {})
      
      get '/api/v1/recipes'
      expect(response).to be_successful

      recipe = JSON.parse(response.body, symbolize_names: true)[:data][0]
      expect(recipe[:attributes]).to have_key(:title)
      expect(recipe[:attributes][:title]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:url)
      expect(recipe[:attributes][:url]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:country)
      expect(recipe[:attributes][:country]).to be_a(String)

      expect(recipe[:attributes]).to have_key(:image)
      expect(recipe[:attributes][:image]).to be_a(String)

      expect(recipe[:attributes]).to_not have_key(:uri)
      expect(recipe[:attributes]).to_not have_key(:ingredients)
      expect(recipe[:attributes]).to_not have_key(:calories)
    end
  end

  it 'returns an empty response if no country is given' do
    get '/api/v1/recipes?country='

    expect(response).to be_successful

    recipe = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(recipe).to eq([])
  end

  it 'returns an empty array when an parameter is entered' do
    get '/api/v1/recipes?country=gheryihb'

    expect(response).to be_successful

    recipe = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(recipe).to eq([])
  end
end