class Api::V1::PotentialAnswersController < Api::BaseApiController
  before_action :set_potential_answer, only: [:show, :update, :destroy]

  respond_to :json, :xml

  def index
    @potential_answers = PotentialAnswer.all
    respond_with @potential_answers
  end

  def show
    respond_with PotentialAnswer.find(params[:id])
  end

  def create
    respond_with PotentialAnswer.create(potential_answer_params)
  end

  def update
    obj = PotentialAnswer.update(params[:id], potential_answer_params)
    render json: obj
  end

  def destroy
    respond_with @potential_answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_answer
      @potential_answer = PotentialAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potential_answer_params
      params.required(:potential_answer).permit(:question_id, :answer)
    end
end
