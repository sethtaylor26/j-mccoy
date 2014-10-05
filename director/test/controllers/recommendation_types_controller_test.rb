require 'test_helper'

class RecommendationTypesControllerTest < ActionController::TestCase
  setup do
    @recommendation_type = recommendation_types(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendation_types)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create recommendation_type" do
    sign_in users(:one)
    assert_difference('RecommendationType.count') do
      post :create, recommendation_type: { descr: @recommendation_type.descr, rec_type: @recommendation_type.rec_type }
    end

    assert_redirected_to recommendation_type_path(assigns(:recommendation_type))
  end

  test "should show recommendation_type" do
    sign_in users(:one)
    get :show, id: @recommendation_type
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @recommendation_type
    assert_response :success
  end

  test "should update recommendation_type" do
    sign_in users(:one)
    patch :update, id: @recommendation_type, recommendation_type: { descr: @recommendation_type.descr, rec_type: @recommendation_type.rec_type }
    assert_redirected_to recommendation_type_path(assigns(:recommendation_type))
  end

  test "should destroy recommendation_type" do
    sign_in users(:one)
    assert_difference('RecommendationType.count', -1) do
      delete :destroy, id: @recommendation_type
    end

    assert_redirected_to recommendation_types_path
  end
end
