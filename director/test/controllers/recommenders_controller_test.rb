require 'test_helper'

class RecommendersControllerTest < ActionController::TestCase
  setup do
    @recommender = recommenders(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:recommenders)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create recommender" do
    sign_in users(:one)
    assert_difference('Recommender.count') do
      post :create, recommender: { desc: @recommender.desc, first_name: @recommender.first_name, last_name: @recommender.last_name }
    end

    assert_redirected_to recommender_path(assigns(:recommender))
  end

  test "should show recommender" do
    sign_in users(:one)
    get :show, id: @recommender
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @recommender
    assert_response :success
  end

  test "should update recommender" do
    sign_in users(:one)
    patch :update, id: @recommender, recommender: { desc: @recommender.desc, first_name: @recommender.first_name, last_name: @recommender.last_name }
    assert_redirected_to recommender_path(assigns(:recommender))
  end

  test "should destroy recommender" do
    sign_in users(:one)
    assert_difference('Recommender.count', -1) do
      delete :destroy, id: @recommender
    end

    assert_redirected_to recommenders_path
  end
end
