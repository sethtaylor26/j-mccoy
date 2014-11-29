require 'rails_helper'

RSpec.describe Api::V1::OpenHoursController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      open_hour = FactoryGirl.create(:open_hour)

      get '/api/open_hours', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json['open_hours'][0]['id']).to eq open_hour.id
      expect(json['open_hours'][0]['event_id']).to eq open_hour.event_id
      expect(json['open_hours'][0]['day_of_the_week']).to eq open_hour.day_of_the_week
      expect(json['open_hours'][0]['open_hour']).to eq open_hour.open_hour
      expect(json['open_hours'][0]['close_hour']).to eq open_hour.close_hour

    end

    it "gets a single open hour by id" do
      open_hour = FactoryGirl.create(:open_hour)

      get '/api/open_hours/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/open_hours', {"open_hour" => {"event_id" => 1, "day_of_the_week" => "Monday", "open_hour" => "08:00", "close_hour" => "23:00"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a open hour" do
      open_hour = FactoryGirl.create(:open_hour)

      put "/api/open_hours/#{open_hour.id}", {"open_hour" => {"event_id" => 1, "day_of_the_week" => "Monday", "open_hour" => "09:00", "close_hour" => "23:00"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json['open_hour']['open_hour']).to eq "09:00"

    end
  end

  describe "DELETE" do	
    it "destroys an open hour" do
      open_hour = FactoryGirl.create(:open_hour)

      delete "/api/open_hours/#{open_hour.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end