require 'rails_helper'

RSpec.describe Api::V1::EventTypesController do

  describe "GET 'index'" do
    it "gets the expected values" do

      event_type = FactoryGirl.create(:event_type)

      get '/api/event_types', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json; version=1'

      expect(response).to be_success

      expect(json["event_types"][0]["id"]).to eq 1
      expect(json["event_types"][0]["event_type_name"]).to eq 'Food'
      expect(json["event_types"][0]["parent"]).to eq 1
      expect(json["event_types"][0]["image"]).to_not be nil

    end
  end

  describe "POST 'index'" do
  	it "posts with the expected values" do
  	  post '/api/event_types', {"event_type" => {"event_type_name" => "event name", "parent" => 1, "image" => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/images/myfile.jpg')))}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a event type" do
      event_type = FactoryGirl.create(:event_type)

      put "/api/event_types/#{event_type.id}", {"event_type" => {"event_type_name" => "jim", "parent" => nil, "image" => "blah"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "DELETE" do
    it "destroys a user answer" do
      event_type = FactoryGirl.create(:event_type)

      delete "/api/event_types/#{event_type.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end