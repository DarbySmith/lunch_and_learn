require 'rails_helper'

RSpec.describe 'saves a users favorites' do
  it 'creates favorite recipes for a user' do
    user = User.create(name: "Dunk", email: "chonkiest@gmail.com")
    body = {
    "api_key": user.api_key,
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    
    post '/api/v1/favorites', headers: headers, params: JSON.generate(body)

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(response.body).to eq("{\"success\":\"Favorite added successfully\"}")
  end

  it 'will return an error if a user does not exist' do
    body = {
    "api_key": "1243465365",
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    
    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: body)

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"error\":\"Unable to save favorite\"}")
  end

  it 'will return an error if any of the parameters are missing' do
    body = {
    "api_key": "1243465365",
    "country": "",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    
    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: body)

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"error\":\"Unable to save favorite\"}")
  end

  it 'will return an error if any of the parameters are missing' do
    body = {
    "api_key": "1243465365",
    "country": "thailand",
    "recipe_link": "",
    "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    
    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: body)

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"error\":\"Unable to save favorite\"}")
  end

  it 'will return an error if any of the parameters are missing' do
    body = {
    "api_key": "1243465365",
    "country": "thailand",
    "recipe_link": "https://www.tastingtable.com/.....",
    "recipe_title": ""
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    
    post '/api/v1/favorites', headers: headers, params: JSON.generate(favorite: body)

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"error\":\"Unable to save favorite\"}")
  end
end