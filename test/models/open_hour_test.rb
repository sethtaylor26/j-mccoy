require 'test_helper'

class OpenHourTest < ActiveSupport::TestCase

  test "should not save without an event id, day, open hour, close hour" do
    open_hour = OpenHour.new
    assert_not open_hour.save, "Tried to save without event id, day, open hour, close hour"
  end	

end
