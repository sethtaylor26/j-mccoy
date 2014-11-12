require 'test_helper'

class PotentialAnswerTest < ActiveSupport::TestCase
  test "should not save without a answer text" do
    potential_answer = PotentialAnswer.new
    assert_not potential_answer.save, "Saved the potential answer without an answer text"
  end	

end
