require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create event" do
    sign_in users(:one)
    assert_difference('Event.count') do
      post :create, event: { address: @event.address, comments: @event.comments, cost: @event.cost, end_time: @event.end_time, event_type_id: @event.event_type_id, image_url: @event.image_url, location_lat: @event.location_lat, location_long: @event.location_long, long_review: @event.long_review, recommender_id: @event.recommender_id, short_review: @event.short_review, spice: @event.spice, start_time: @event.start_time, title: @event.title, web_site_url: @event.web_site_url }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    sign_in users(:one)
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    sign_in users(:one)
    patch :update, id: @event, event: { address: @event.address, comments: @event.comments, cost: @event.cost, end_time: @event.end_time, event_type_id: @event.event_type_id, image_url: @event.image_url, location_lat: @event.location_lat, location_long: @event.location_long, long_review: @event.long_review, recommender_id: @event.recommender_id, short_review: @event.short_review, spice: @event.spice, start_time: @event.start_time, title: @event.title, web_site_url: @event.web_site_url }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    sign_in users(:one)
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
