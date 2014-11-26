require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::RegistrationsController, :type => :controller do

  describe 'create user' do
    it "should create a new user" do
	  post :create, {:email => 'test@example.com', :password => 'Test1234', :password_confirmation => 'Test1234'}
	  debugger
      expect(response.body).to match ("authentication_token")
    end
  end

end