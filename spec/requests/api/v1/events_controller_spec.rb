require 'rails_helper'

RSpec.describe Api::V1::EventsController do

  before do
  	sign_in_as_a_valid_user
  end

  describe "GET 'index'" do
    
    it "gets the expected values" do

      event = FactoryGirl.create(:event)

      get '/api/events', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json['events'][0]['id']).to eq event.id
      #expect(json['events'][0]['event_type']).to exist
      expect(json['events'][0]['start_time']).to_not be nil
      expect(json['events'][0]['end_time']).to_not be nil
      expect(json['events'][0]['title']).to_not be nil
      expect(json['events'][0]['short_review']).to_not be nil
      expect(json['events'][0]['long_review']).to_not be nil
      expect(json['events'][0]['web_site_url']).to_not be nil
      expect(json['events'][0]['location_lat']).to_not be nil
      expect(json['events'][0]['location_long']).to eq event.location_long
      expect(json['events'][0]['address']).to eq event.address
      expect(json['events'][0]['spice']).to eq event.spice
      expect(json['events'][0]['cost']).to eq event.cost
      #expect(json['events'][0]['recommender']).to exist
      expect(json['events'][0]['image']).to_not be nil
      expect(json['events'][0]['comments']).to eq event.comments
      expect(json['events'][0]['general_hours']).to eq event.general_hours
      #expect(json['events'][0]['recommendation_type']).to exist

    end

    it "gets a single event by id" do
      event = FactoryGirl.create(:event)

      get '/api/events/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/events', {"event" => {"event_type_id" => 1, "start_time" => "", "end_time" => "", "title" => "title", "short_review" => "short review", "long_review" => "long review", "web_site_url" => "example.com", "location_lat" => 1.1, "location_long" => 1.2, "address" => "123 Main", "spice" => 1, "cost" => 1, "image" => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/images/myfile.jpg'))), "comments" => "comments", "general_hours" => 't'}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a event type" do
      event = FactoryGirl.create(:event)

      put "/api/events/#{event.id}", {"event" => {"event_type_id" => 1, "start_time" => "", "end_time" => "", "title" => "title update", "short_review" => "short review", "long_review" => "long review", "web_site_url" => "example.com", "location_lat" => 1.1, "location_long" => 1.2, "address" => "123 Main", "spice" => 1, "cost" => 1, "image" => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/factories/images/myfile.jpg'))), "comments" => "comments", "general_hours" => 't'}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      event = FactoryGirl.create(:event)

      delete "/api/events/#{event.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end