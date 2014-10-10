require 'test_helper'

class EventTypeTest < ActiveSupport::TestCase
  test "should not save event_type without event_type_name" do
     event_type = EventType.new
     assert_not event_type.save, "Saved the event_type without an event_type_name"
  end
  # test "the truth" do
  #   assert true
  # end
end
