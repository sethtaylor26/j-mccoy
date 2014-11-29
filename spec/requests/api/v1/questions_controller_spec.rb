require 'rails_helper'

RSpec.describe Api::V1::QuestionsController do

  describe "GET 'index'" do
    
    it "gets the expected values" do

      question = FactoryGirl.create(:question)

      get '/api/questions', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json['questions'][0]['id']).to eq question.id

    end

    it "gets a single event by id" do
      question = FactoryGirl.create(:question)

      get '/api/questions/1', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "POST 'index'" do
  	
  	it "posts with the expected values" do

  	  post '/api/questions', {"question" => {"question" => "question 1", "question_type" => "YN"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["question"]["id"]).to eq 1
      expect(json["question"]["question"]).to eq "question 1"
      expect(json["question"]["question_type"]).to eq "YN"
    end
  end

  describe "PUT" do
    it "updates a event type" do
      question = FactoryGirl.create(:question)

      put "/api/questions/#{question.id}", {"question" => {"question" => "question 1 update", "question_type" => "YN"}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["question"]["id"]).to eq 1
      expect(json["question"]["question"]).to eq "question 1 update"
      expect(json["question"]["question_type"]).to eq "YN"

    end
  end

  describe "DELETE" do	
    it "destroys an event" do
      question = FactoryGirl.create(:question)

      delete "/api/questions/#{question.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end