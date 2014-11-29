require 'rails_helper'

RSpec.describe Api::V1::RecommendationTypesController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      recommendation_type = FactoryGirl.create(:recommendation_type)

      get '/api/recommendation_types', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json; version=1'

      expect(response).to be_success

      expect(json['recommendation_types'][0]['id']).to eq recommendation_type.id
      expect(json['recommendation_types'][0]['rec_type']).to eq recommendation_type.rec_type
      expect(json['recommendation_types'][0]['descr']).to eq recommendation_type.descr

    end

    it "gets a single recommendation_type by id" do
      recommendation_type = FactoryGirl.create(:recommendation_type)

      get '/api/recommendation_types/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/recommendation_types', {"recommendation_type" => {"rec_type" => "Best Of", "descr" => "this is the description"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a recommendation_type" do
      recommendation_type = FactoryGirl.create(:recommendation_type)

      put "/api/recommendation_types/#{recommendation_type.id}", {"recommendation_type" => {"rec_type" => "Best Of", "descr" => "this is the description"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      recommendation_type = FactoryGirl.create(:recommendation_type)

      delete "/api/recommendation_types/#{recommendation_type.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end