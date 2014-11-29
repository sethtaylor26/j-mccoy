class Api::V1::RecommendationTypesController < Api::BaseApiController
  before_action :set_recommendation_type, only: [:show, :edit, :update, :destroy]

  respond_to :json, :xml

  def index
    @recommendation_types = RecommendationType.all
    respond_with @recommendation_types
  end

  def show
    respond_with RecommendationType.find(params[:id])
  end

  def create
    respond_with RecommendationType.create(recommendation_type_params)
  end

  def update
    obj = RecommendationType.update(params[:id], recommendation_type_params)
    render json: obj
  end

  def destroy
    respond_with @recommendation_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation_type
      @recommendation_type = RecommendationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_type_params
      params.require(:recommendation_type).permit(:rec_type, :descr)
    end
end
