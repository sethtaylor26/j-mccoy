require 'test_helper'

class UserAnswerTest < ActiveSupport::TestCase

  test "do not save with out user_id or potential_answer_id" do
    user_answer = UserAnswer.new
    assert_not user_answer.save, "user answer saved without user_id or potential_answer_id"
  end

end
