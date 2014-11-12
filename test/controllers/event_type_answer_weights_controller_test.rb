require 'test_helper'

class EventTypeAnswerWeightsControllerTest < ActionController::TestCase
  setup do
    @event_type_answer_weight = event_type_answer_weights(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:event_type_answer_weights)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create event_type_answer_weight" do
    sign_in users(:one)
    assert_difference('EventTypeAnswerWeight.count') do
      post :create, event_type_answer_weight: { event_type_id: @event_type_answer_weight.event_type_id, potential_answer_id: @event_type_answer_weight.potential_answer_id, weight: @event_type_answer_weight.weight }
    end

    assert_redirected_to event_type_answer_weight_path(assigns(:event_type_answer_weight))
  end

  test "should show event_type_answer_weight" do
    sign_in users(:one)
    get :show, id: @event_type_answer_weight
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @event_type_answer_weight
    assert_response :success
  end

  test "should update event_type_answer_weight" do
    sign_in users(:one)
    patch :update, id: @event_type_answer_weight, event_type_answer_weight: { event_type_id: @event_type_answer_weight.event_type_id, potential_answer_id: @event_type_answer_weight.potential_answer_id, weight: @event_type_answer_weight.weight }
    assert_redirected_to event_type_answer_weight_path(assigns(:event_type_answer_weight))
  end

  test "should destroy event_type_answer_weight" do
    sign_in users(:one)
    assert_difference('EventTypeAnswerWeight.count', -1) do
      delete :destroy, id: @event_type_answer_weight
    end

    assert_redirected_to event_type_answer_weights_path
  end
end
