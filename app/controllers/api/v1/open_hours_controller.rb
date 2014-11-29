class Api::V1::OpenHoursController < Api::BaseApiController
  before_action :set_open_hour, only: [:show, :update, :destroy]

  respond_to :json, :xml

  def index
    @open_hours = OpenHour.all
    respond_with @open_hours
  end

  def show
    respond_with OpenHour.find(params[:id])
  end

  def create
    respond_with OpenHour.create(open_hour_params)
  end

  def update
    obj = OpenHour.update(params[:id], open_hour_params)
    render json: obj
  end

  def destroy
    respond_with @open_hour.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_open_hour
      @open_hour = OpenHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def open_hour_params
      params.required(:open_hour).permit(:event_id, :day_of_the_week, :open_hour, :close_hour)
    end
end
