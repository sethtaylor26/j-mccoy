class Api::V1::EventTypeAnswerWeightsController < Api::BaseApiController
  before_action :set_event_type_answer_weight, only: [:show, :edit, :update, :destroy]

  respond_to :json, :xml

  def index
    @event_type_answer_weights = EventTypeAnswerWeight.all
    respond_with @event_type_answer_weights
  end

  def show
    respond_with EventTypeAnswerWeight.find(params[:id])
  end

  def create
    respond_with EventTypeAnswerWeight.create(event_type_answer_weight_params)
  end

  def update
    obj = EventTypeAnswerWeight.update(params[:id], event_type_answer_weight_params)
    render json: obj
  end

  def destroy
    respond_with @event_type_answer_weight.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type_answer_weight
      @event_type_answer_weight = EventTypeAnswerWeight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_type_answer_weight_params
      params.require(:event_type_answer_weight).permit(:potential_answer_id, :event_type_id, :weight)
    end
end
