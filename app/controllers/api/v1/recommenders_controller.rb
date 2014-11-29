class Api::V1::RecommendersController < Api::BaseApiController
  before_action :set_recommender, only: [:show, :edit, :update, :destroy]

  respond_to :json, :xml

  def index
    @recommenders = Recommender.all
    respond_with @recommenders
  end

  def show
    respond_with Recommender.find(params[:id])
  end

  def create
    respond_with Recommender.create(recommender_params)
  end

  def update
    obj = Recommender.update(params[:id], recommender_params)
    render json: obj
  end

  def destroy
    respond_with @recommender.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommender
      @recommender = Recommender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommender_params
      params.require(:recommender).permit(:first_name, :last_name, :descr)
    end
end
