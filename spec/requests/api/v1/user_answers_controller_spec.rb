require 'rails_helper'

RSpec.describe Api::V1::UserAnswersController do

  describe "GET 'index'" do
    it "gets the expected values" do

      user = FactoryGirl.create(:user)
      user_answer = FactoryGirl.create(:user_answer, user_id: user.id)

      get '/api/user_answers', {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["user_answers"][0]["id"]).to eq 1
      expect(json["user_answers"][0]["user_id"]).to eq 1
      expect(json["user_answers"][0]["potential_answer_id"]).to eq 1
    end
  end

  describe "POST 'index'" do
  	it "posts with the expected values" do
  	  post '/api/user_answers', {"user_answer" => {"user_id" => 1, "question_id" => 1, "potential_answer_id" => 1}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

    end
  end

  describe "PUT" do
    it "updates a user answer" do
      user = FactoryGirl.create(:user)
      user_answer = FactoryGirl.create(:user_answer, user_id: user.id)

      put "/api/user_answers/#{user_answer.id}", {"user_answer" => {"user_id" => 1, "question_id" => 1,"potential_answer_id" => 2}}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response).to be_success

      expect(json["user_answer"]["potential_answer_id"]).to eq 2

    end
  end

  describe "DELETE" do
    it "destroys a user answer" do
      user = FactoryGirl.create(:user)
      user_answer = FactoryGirl.create(:user_answer, user_id: user.id)

      delete "/api/user_answers/#{user_answer.id}", {}, 'HTTP_ACCEPT' => 'application/vnd.director+json;version=1'

      expect(response.status).to eq 204
    end
  end

end