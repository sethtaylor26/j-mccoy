require 'test_helper'

class RecommendationTypesControllerTest < ActionController::TestCase
  setup do
    @recommendation_type = recommendation_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendation_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommendation_type" do
    assert_difference('RecommendationType.count') do
      post :create, recommendation_type: { descr: @recommendation_type.descr, type: @recommendation_type.type }
    end

    assert_redirected_to recommendation_type_path(assigns(:recommendation_type))
  end

  test "should show recommendation_type" do
    get :show, id: @recommendation_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommendation_type
    assert_response :success
  end

  test "should update recommendation_type" do
    patch :update, id: @recommendation_type, recommendation_type: { descr: @recommendation_type.descr, type: @recommendation_type.type }
    assert_redirected_to recommendation_type_path(assigns(:recommendation_type))
  end

  test "should destroy recommendation_type" do
    assert_difference('RecommendationType.count', -1) do
      delete :destroy, id: @recommendation_type
    end

    assert_redirected_to recommendation_types_path
  end
end
