class Api::V1::EventsController < Api::BaseApiController
  before_action :set_event, only: [:show, :update, :destroy]

  respond_to :json, :xml

  def index
    user = User.find(current_user)
    if !params[:start_time].present? || !params[:end_time].present? || !params[:spice].present? || !params[:cost].present?
      @events = Event.all
    else
      rslt = QueryEvents.new.call(params, user)
      if rslt.success
        @events = rslt.obj
      end
    end

    respond_with @events
  end

  def show
    respond_with Event.find(params[:id])
  end

  def create
    respond_with Event.create(event_params)
  end

  def update
    obj = Event.update(params[:id], event_params)
    render json: obj
  end

  def destroy
    respond_with @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_type_id, :start_time, :end_time, :title, :short_review, :long_review, :web_site_url, :location_lat, :location_long, :address, :spice, :cost, :recommender_id, :image, :comments, :general_hours, :recommendation_type_id)
    end
end
