require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "save without event_type, start_time, end_time, title, location_lat, location_long, spice, or cost" do
    event = Event.new
    assert_not event.save, "saved without event_type, start_time, end_time, title, location_lat, location_long, spice, or cost"
  end
end
