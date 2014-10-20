require 'test_helper'

class OpenHoursControllerTest < ActionController::TestCase
  setup do
    @open_hour = open_hours(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:open_hours)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create open_hour" do
    sign_in users(:one)
    assert_difference('OpenHour.count') do
      post :create, open_hour: { close_hour: @open_hour.close_hour, day_of_the_week: @open_hour.day_of_the_week, event_id: @open_hour.event_id, open_hour: @open_hour.open_hour }
    end

    assert_redirected_to open_hour_path(assigns(:open_hour))
  end

  test "should show open_hour" do
    sign_in users(:one)
    get :show, id: @open_hour
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @open_hour
    assert_response :success
  end

  test "should update open_hour" do
    sign_in users(:one)
    patch :update, id: @open_hour, open_hour: { close_hour: @open_hour.close_hour, day_of_the_week: @open_hour.day_of_the_week, event_id: @open_hour.event_id, open_hour: @open_hour.open_hour }
    assert_redirected_to open_hour_path(assigns(:open_hour))
  end

  test "should destroy open_hour" do
    sign_in users(:one)
    assert_difference('OpenHour.count', -1) do
      delete :destroy, id: @open_hour
    end

    assert_redirected_to open_hours_path
  end
end
