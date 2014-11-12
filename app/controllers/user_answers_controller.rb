class UserAnswersController < ApplicationController
  before_action :set_user_answer, only: [:show, :edit, :update, :destroy]

  def index
    @user_answers = UserAnswer.all
  end

  def show
  end

  def new
    @user_answer = UserAnswer.new
  end

  def edit
  end

  # POST /user_answers
  # POST /user_answers.json
  def create
    @user_answer = UserAnswer.new(user_answer_params)

    respond_to do |format|
      if @user_answer.save
        format.html { redirect_to @user_answer, notice: 'User answer was successfully created.' }
        format.json { render :show, status: :created, location: @user_answer }
      else
        format.html { render :new }
        format.json { render json: @user_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_answers/1
  # PATCH/PUT /user_answers/1.json
  def update
    respond_to do |format|
      if @user_answer.update(user_answer_params)
        format.html { redirect_to @user_answer, notice: 'User answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_answer }
      else
        format.html { render :edit }
        format.json { render json: @user_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_answers/1
  # DELETE /user_answers/1.json
  def destroy
    @user_answer.destroy
    respond_to do |format|
      format.html { redirect_to user_answers_url, notice: 'User answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_answer
      @user_answer = UserAnswer.find(params[:id])
    end

    def user_answer_params
      params.require(:user_answer).permit(:user_id, :potential_answer_id)
    end
end
