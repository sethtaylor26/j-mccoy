class Api::V1::EventTypesController < Api::BaseApiController
  before_action :set_event_type, only: [:show, :update, :destroy]

  respond_to :json, :xml

  def index
    @event_types = EventType.all
    respond_with @event_types
  end

  def show
    respond_with EventType.find(params[:id])
  end

  def create
    respond_with EventType.create(event_type_params)
  end

  def update
    obj = EventType.update(params[:id], event_type_params)
    render json: obj
  end

  def destroy
    respond_with @event_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_type
      @event_type = EventType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_type_params
      params.require(:event_type).permit(:event_type_name, :parent, :image)
    end
end
