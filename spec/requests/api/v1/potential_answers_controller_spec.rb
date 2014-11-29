require 'rails_helper'

RSpec.describe Api::V1::PotentialAnswersController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      potential_answer = FactoryGirl.create(:potential_answer)

      get '/api/potential_answers', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json['potential_answers'][0]['id']).to eq potential_answer.id
      expect(json['potential_answers'][0]['question_id']).to eq potential_answer.question_id
      expect(json['potential_answers'][0]['answer']).to eq potential_answer.answer

    end

    it "gets a single potential answer by id" do
      potential_answer = FactoryGirl.create(:potential_answer)

      get '/api/potential_answers/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/potential_answers', {"potential_answer" => {"question_id" => 1, "answer" => "answer 1"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["potential_answer"]["id"]).to eq 1
      expect(json["potential_answer"]["question_id"]).to eq 1
      expect(json["potential_answer"]["answer"]).to eq "answer 1"
    end
  end

  describe "PUT" do
    it "updates a potential_answer" do
      potential_answer = FactoryGirl.create(:potential_answer)

      put "/api/potential_answers/#{potential_answer.id}", {"potential_answer" => {"question_id" => 1, "answer" => "answer 1 update"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["potential_answer"]["id"]).to eq 1
      expect(json["potential_answer"]["question_id"]).to eq 1
      expect(json["potential_answer"]["answer"]).to eq "answer 1 update"

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      potential_answer = FactoryGirl.create(:potential_answer)

      delete "/api/potential_answers/#{potential_answer.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end