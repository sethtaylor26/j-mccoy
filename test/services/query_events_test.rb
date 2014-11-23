require 'test_helper'

class QueryEventTest < ActiveSupport::TestCase

  test "get all events filter" do
    events = QueryEvents.new.call({})
    assert events.find_by! title: 'This is one'
    assert events.find_by! title: 'This is two'
  end

  test "get start date filter" do
    events = QueryEvents.new.call({start_time: "2014-09-27T13:45:0000"})
    assert events.count() == 2, 'Getting the wrong number of results from the start_time filter'
    assert events[0].title == "This is two", "First event is not 'This is two'"
    assert events[1].title == "This is three", "Second event is not 'This is three'"
  end

  test "get end date filter" do
    events = QueryEvents.new.call({end_time: "2013-09-28 15:00:00"})
    assert events.count() == 2, 'Getting the wrong number of results from the end_time filter'
    assert events[0].title == "This is one", "First event is not 'This is one'"
    assert events[1].title == "This is three", "Second event is not 'This is three'"
  end

  test "get cost filter" do
    events = QueryEvents.new.call({cost: "1"})
    assert events.count() == 1, 'Getting the wrong number of results from the cost filter'
  end

  test "get spice filter" do
    events = QueryEvents.new.call({spice: "1"})
    assert events.count() == 1, 'Getting the wrong number of results from the spice filter'
  end

  test "get top events based on user answer weights" do
    events = QueryEvents.new.call({top_events: "true"}).take
    assert events.title == "This is two", 'Top events not returning the correct event as top result.  Should be event two'
  end

end