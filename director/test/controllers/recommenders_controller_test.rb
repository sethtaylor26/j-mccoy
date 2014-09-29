require 'test_helper'

class RecommendersControllerTest < ActionController::TestCase
  setup do
    @recommender = recommenders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommenders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommender" do
    assert_difference('Recommender.count') do
      post :create, recommender: { desc: @recommender.desc, first_name: @recommender.first_name, last_name: @recommender.last_name }
    end

    assert_redirected_to recommender_path(assigns(:recommender))
  end

  test "should show recommender" do
    get :show, id: @recommender
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommender
    assert_response :success
  end

  test "should update recommender" do
    patch :update, id: @recommender, recommender: { desc: @recommender.desc, first_name: @recommender.first_name, last_name: @recommender.last_name }
    assert_redirected_to recommender_path(assigns(:recommender))
  end

  test "should destroy recommender" do
    assert_difference('Recommender.count', -1) do
      delete :destroy, id: @recommender
    end

    assert_redirected_to recommenders_path
  end
end
