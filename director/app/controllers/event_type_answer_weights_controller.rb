class EventTypeAnswerWeightsController < ApplicationController
  before_action :set_event_type_answer_weight, only: [:show, :edit, :update, :destroy]

  # GET /event_type_answer_weights
  # GET /event_type_answer_weights.json
  def index
    @event_type_answer_weights = EventTypeAnswerWeight.all
  end

  # GET /event_type_answer_weights/1
  # GET /event_type_answer_weights/1.json
  def show
  end

  # GET /event_type_answer_weights/new
  def new
    @event_type_answer_weight = EventTypeAnswerWeight.new
  end

  # GET /event_type_answer_weights/1/edit
  def edit
  end

  # POST /event_type_answer_weights
  # POST /event_type_answer_weights.json
  def create
    @event_type_answer_weight = EventTypeAnswerWeight.new(event_type_answer_weight_params)

    respond_to do |format|
      if @event_type_answer_weight.save
        format.html { redirect_to @event_type_answer_weight, notice: 'Event type answer weight was successfully created.' }
        format.json { render :show, status: :created, location: @event_type_answer_weight }
      else
        format.html { render :new }
        format.json { render json: @event_type_answer_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_type_answer_weights/1
  # PATCH/PUT /event_type_answer_weights/1.json
  def update
    respond_to do |format|
      if @event_type_answer_weight.update(event_type_answer_weight_params)
        format.html { redirect_to @event_type_answer_weight, notice: 'Event type answer weight was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_type_answer_weight }
      else
        format.html { render :edit }
        format.json { render json: @event_type_answer_weight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_type_answer_weights/1
  # DELETE /event_type_answer_weights/1.json
  def destroy
    @event_type_answer_weight.destroy
    respond_to do |format|
      format.html { redirect_to event_type_answer_weights_url, notice: 'Event type answer weight was successfully destroyed.' }
      format.json { head :no_content }
    end
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
