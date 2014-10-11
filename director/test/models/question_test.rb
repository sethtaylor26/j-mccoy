require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  test "should not save without a question text" do
    question = Question.new
    assert_not question.save, "Saved the question without an event_type_name"
  end

end
