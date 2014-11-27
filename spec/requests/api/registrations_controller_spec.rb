require 'rails_helper'

RSpec.describe Api::RegistrationsController do

  describe 'create user' do
    it "should create a new user" do
	  post 'api/register', {:email => 'test@example.com', :password => 'Test1234', :password_confirmation => 'Test1234'}

	  rslt = JSON.parse(response.body)

	  expect(rslt["id"]).to eq 1
	  expect(rslt["authentication_token"]).to_not be nil

      expect(response.body).to match ("authentication_token")
    end
  end

end