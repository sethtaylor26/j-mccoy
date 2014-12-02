class Api::V1::UserAnswersController < Api::BaseApiController
  before_action :set_user_answer, only: [:show, :update, :destroy]

  respond_to :json, :xml

  def index
    @user_answers = UserAnswer.all
    respond_with @user_answers
  end

  def show
    respond_with UserAnswer.find(params[:id])
  end

  def create
    respond_with UserAnswer.create(user_answer_params)
  end

  def update
    obj = UserAnswer.update(params[:id], user_answer_params)
    render json: obj
  end

  def destroy
    respond_with @user_answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_answer
      @user_answer = UserAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_answer_params
      params.required(:user_answer).permit(:user_id, :question_id, :potential_answer_id)
    end
end
