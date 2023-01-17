require 'rails_helper' 

RSpec.describe 'Get user favorites' do
  it 'should return all recipes that a user favorited' do
    user = create(:user)
    recipe_1 = create(:favorite, user_id: user.id)
    recipe_2 = create(:favorite, user_id: user.id)
    recipe_3 = create(:favorite, user_id: user.id)

    get "/api/v1/favorites?api_key=#{user.api_key}"

    expect(response).to be_successful
    recipe = JSON.parse(response.body, symbolize_names: true)[:data][0]
    
    expect(recipe[:attributes]).to have_key(:recipe_title)
    expect(recipe[:attributes]).to have_key(:recipe_link)
    expect(recipe[:attributes]).to have_key(:country)
    expect(recipe[:attributes]).to have_key(:created_at)
  end

  it 'returns no recipes if the user has no favorites' do
    user = create(:user)

    get "/api/v1/favorites?api_key=#{user.api_key}"
    
    expect(response).to be_successful
    recipe = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(recipe).to eq([])
  end

  it 'returns an error if it is not a valid api_key' do
    get "/api/v1/favorites?api_key=1546sdg546dsh7"

    expect(response).to have_http_status(400)
    expect(response.body).to eq("{\"error\":\"User not found\"}")
  end
end