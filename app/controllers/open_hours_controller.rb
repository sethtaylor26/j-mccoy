class OpenHoursController < ApplicationController
  before_action :set_open_hour, only: [:show, :edit, :update, :destroy]

  def index
    @open_hours = OpenHour.all
  end

  def import
    OpenHour.import(params[:file])
    redirect_to open_hours_url, notice: "Open Hours imported."
  end

  def show
  end

  def new
    @open_hour = OpenHour.new
  end

  def edit
  end

  def create
    @open_hour = OpenHour.new(open_hour_params)
    respond_to do |format|
      if @open_hour.save
        format.html { redirect_to @open_hour, notice: 'Open hour was successfully created.' }
        format.json { render :show, status: :created, location: @open_hour }
      else
        format.html { render :new }
        format.json { render json: @open_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @open_hour.update(open_hour_params)
        format.html { redirect_to @open_hour, notice: 'Open hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @open_hour }
      else
        format.html { render :edit }
        format.json { render json: @open_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @open_hour.destroy
    respond_to do |format|
      format.html { redirect_to open_hours_url, notice: 'Open hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_open_hour
      @open_hour = OpenHour.find(params[:id])
    end

    def open_hour_params
      params.require(:open_hour).permit(:event_id, :day_of_the_week, :open_hour, :close_hour)
    end
end
