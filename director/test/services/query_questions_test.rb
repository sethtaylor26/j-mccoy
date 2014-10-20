require 'test_helper'

class QueryQuestionTest < ActiveSupport::TestCase

  test "get all questions filter" do
    questions = QueryQuestions.new.call({})
    assert questions.find_by! question: 'This is one'
    assert questions.find_by! question: 'This is two'
  end

  test "get YN questions filter" do
  	questions = QueryQuestions.new.call({question_type: "YN"})
  	assert questions.find_by! question: 'This is one'
  	assert questions.count() == 1
  end

  test "get EO questions filter" do
  	questions = QueryQuestions.new.call({question_type: "EO"})
  	assert questions.find_by! question: 'This is two'
  	assert questions.count() == 1
  end

end