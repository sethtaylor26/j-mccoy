require 'rails_helper'

RSpec.describe Api::V1::EventTypeAnswerWeightsController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight)

      get '/api/event_type_answer_weights', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json; version=1'

      expect(response).to be_success

      #Todo: Figure out how to test emedded objects.  Works fine in actual API calls
      expect(json['event_type_answer_weights'][0]['id']).to eq event_type_answer_weight.id
      #expect(json['event_type_answer_weights'][0]['potential_answer']).to eq event_type_answer_weight.potential_answer_id
      #expect(json['event_type_answer_weights'][0]['event_type']).to eq event_type_answer_weight.event_type_id
      expect(json['event_type_answer_weights'][0]['weight']).to eq event_type_answer_weight.weight

    end

    it "gets a single event_type_answer_weight by id" do
      event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight)

      get '/api/event_type_answer_weights/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/event_type_answer_weights', {"event_type_answer_weight" => {"potential_answer_id" => 1, "event_type_id" => 1, "weight" => 1}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a event_type_answer_weight" do
      event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight)

      put "/api/event_type_answer_weights/#{event_type_answer_weight.id}", {"event_type_answer_weight" => {"potential_answer_id" => 1, "event_type_id" => 1, "weight" => 1}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      event_type_answer_weight = FactoryGirl.create(:event_type_answer_weight)

      delete "/api/event_type_answer_weights/#{event_type_answer_weight.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end