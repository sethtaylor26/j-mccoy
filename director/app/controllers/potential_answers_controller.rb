class PotentialAnswersController < ApplicationController
  before_action :set_potential_answer, only: [:show, :edit, :update, :destroy]

  # GET /potential_answers
  # GET /potential_answers.json
  def index
    @potential_answers = PotentialAnswer.all
  end

  # GET /potential_answers/1
  # GET /potential_answers/1.json
  def show
  end

  # GET /potential_answers/new
  def new
    @potential_answer = PotentialAnswer.new
  end

  # GET /potential_answers/1/edit
  def edit
  end

  # POST /potential_answers
  # POST /potential_answers.json
  def create
    @potential_answer = PotentialAnswer.new(potential_answer_params)

    respond_to do |format|
      if @potential_answer.save
        format.html { redirect_to @potential_answer, notice: 'Potential answer was successfully created.' }
        format.json { render :show, status: :created, location: @potential_answer }
      else
        format.html { render :new }
        format.json { render json: @potential_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /potential_answers/1
  # PATCH/PUT /potential_answers/1.json
  def update
    respond_to do |format|
      if @potential_answer.update(potential_answer_params)
        format.html { redirect_to @potential_answer, notice: 'Potential answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @potential_answer }
      else
        format.html { render :edit }
        format.json { render json: @potential_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /potential_answers/1
  # DELETE /potential_answers/1.json
  def destroy
    @potential_answer.destroy
    respond_to do |format|
      format.html { redirect_to potential_answers_url, notice: 'Potential answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_potential_answer
      @potential_answer = PotentialAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def potential_answer_params
      params.require(:potential_answer).permit(:questions_id, :answer, :answer_weight)
    end
end
