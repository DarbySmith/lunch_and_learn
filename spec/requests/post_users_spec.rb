require 'rails_helper'

RSpec.describe 'creates a new user' do
  it 'create a new user from a post request' do
    user = {
      "name": "Athena Dao",
      "email": "athenadao@bestgirlever.com"
    }
    headers = { "CONTENT_TYPE" => "application/json" }
    post '/api/v1/users', headers: headers

    last_user = User.last

    expect(response).to be_successful
    expect(last_user.name).to eq("Athena Dao")
    expect(last_user.email).to eq("athenadao@bestgirlever.com")
  end
end