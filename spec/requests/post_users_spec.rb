require 'rails_helper'

RSpec.describe 'creates a new user', type: :request do
  it 'create a new user from a post request' do
    user = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }

    headers = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/users', headers: headers, params: JSON.generate(user: user)

    last_user = User.last

    expect(response).to be_successful
    expect(response).to have_http_status(201)
    expect(last_user.name).to eq("Athena Dao")
    expect(last_user.email).to eq("athenadao@bestgirlever.com")
    expect(last_user.api_key).to_not eq(nil)
  end
end