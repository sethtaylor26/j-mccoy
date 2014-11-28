class Api::V1::QuestionsController < Api::BaseApiController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :json, :xml

  def index
    rslt = QueryQuestions.new.call(params)
    if rslt.success
      @questions = rslt.obj
    end
    respond_with @questions
  end

  def show
    respond_with Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    respond_with Question.create(question_params)
  end

  def update
    obj = Question.update(params[:id], question_params)
    render json: obj
  end

  def destroy
    respond_with @question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :question_type)
    end
end
