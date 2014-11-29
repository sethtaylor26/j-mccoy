require 'rails_helper'

RSpec.describe Api::V1::RecommendersController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      recommender = FactoryGirl.create(:recommender)

      get '/api/recommenders', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json; version=1'

      expect(response).to be_success

      expect(json['recommenders'][0]['id']).to eq recommender.id
      expect(json['recommenders'][0]['first_name']).to eq recommender.first_name
      expect(json['recommenders'][0]['last_name']).to eq recommender.last_name
      expect(json['recommenders'][0]['descr']).to eq recommender.descr

    end

    it "gets a single recommender by id" do
      recommender = FactoryGirl.create(:recommender)

      get '/api/recommenders/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/recommenders', {"recommender" => {"first_name" => "Joe", "last_name" => "Blow", "descr" => "this is the description"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a recommender" do
      recommender = FactoryGirl.create(:recommender)

      put "/api/recommenders/#{recommender.id}", {"recommender" => {"first_name" => "Joe", "last_name" => "Blow", "descr" => "this is the description"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      recommender = FactoryGirl.create(:recommender)

      delete "/api/recommenders/#{recommender.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end