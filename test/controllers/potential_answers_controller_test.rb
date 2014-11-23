require 'test_helper'

class PotentialAnswersControllerTest < ActionController::TestCase
  setup do
    @potential_answer = potential_answers(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:potential_answers)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create potential_answer" do
    sign_in users(:one)
    assert_difference('PotentialAnswer.count') do
      post :create, potential_answer: { answer: @potential_answer.answer, question_id: @potential_answer.question_id }
    end

    assert_redirected_to potential_answer_path(assigns(:potential_answer))
  end

  test "should show potential_answer" do
    sign_in users(:one)
    get :show, id: @potential_answer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @potential_answer
    assert_response :success
  end

  test "should update potential_answer" do
    sign_in users(:one)
    patch :update, id: @potential_answer, potential_answer: { answer: @potential_answer.answer, question_id: @potential_answer.question_id }
    assert_redirected_to potential_answer_path(assigns(:potential_answer))
  end

  test "should destroy potential_answer" do
    sign_in users(:one)
    assert_difference('PotentialAnswer.count', -1) do
      delete :destroy, id: @potential_answer
    end

    assert_redirected_to potential_answers_path
  end
end
