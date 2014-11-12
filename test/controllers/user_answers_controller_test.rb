require 'test_helper'

class UserAnswersControllerTest < ActionController::TestCase
  setup do
    @user_answer = user_answers(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:user_answers)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create user_answer" do
    sign_in users(:one)
    assert_difference('UserAnswer.count') do
      post :create, user_answer: { potential_answer_id: @user_answer.potential_answer_id, user_id: @user_answer.user_id }
    end

    assert_redirected_to user_answer_path(assigns(:user_answer))
  end

  test "should show user_answer" do
    sign_in users(:one)
    get :show, id: @user_answer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @user_answer
    assert_response :success
  end

  test "should update user_answer" do
    sign_in users(:one)
    patch :update, id: @user_answer, user_answer: { potential_answer_id: @user_answer.potential_answer_id, user_id: @user_answer.user_id }
    assert_redirected_to user_answer_path(assigns(:user_answer))
  end

  test "should destroy user_answer" do
    sign_in users(:one)
    assert_difference('UserAnswer.count', -1) do
      delete :destroy, id: @user_answer
    end

    assert_redirected_to user_answers_path
  end
end
