require 'test_helper'

class EventTypeAnswerWeightTest < ActiveSupport::TestCase
  test "do not save with out event_type_id or potential_answer_id" do
    event_type_answer_weight = EventTypeAnswerWeight.new
    assert_not event_type_answer_weight.save, "event_type_answer_weight saved without user_id or potential_answer_id"
  end
end
