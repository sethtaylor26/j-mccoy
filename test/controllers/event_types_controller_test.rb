require 'test_helper'

class EventTypesControllerTest < ActionController::TestCase
  setup do
    @event_type = event_types(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:event_types)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create event_type" do
    sign_in users(:one)
    assert_difference('EventType.count') do
      post :create, event_type: { image: @event_type.image, parent: @event_type.parent, event_type_name: @event_type.event_type_name }
    end

    assert_redirected_to event_type_path(assigns(:event_type))
  end

  test "should show event_type" do
    sign_in users(:one)
    get :show, id: @event_type
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @event_type
    assert_response :success
  end

  test "should update event_type" do
    sign_in users(:one)
    patch :update, id: @event_type, event_type: { image: @event_type.image, parent: @event_type.parent, event_type_name: @event_type.event_type_name }
    assert_redirected_to event_type_path(assigns(:event_type))
  end

  test "should destroy event_type" do
    sign_in users(:one)
    assert_difference('EventType.count', -1) do
      delete :destroy, id: @event_type
    end

    assert_redirected_to event_types_path
  end
end
