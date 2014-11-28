require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController do

  describe 'create user' do
    it "should create a new user" do
	  post '/api/register', {"email" => 'test@example.com', "password" => 'Test1234', "password_confirmation" => 'Test1234'}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'
      
	  expect(response).to be_success

	  expect(json["id"]).to eq 1
	  expect(json["authentication_token"]).to_not be nil

    end
  end

end