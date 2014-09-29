class RecommendersController < ApplicationController
  before_action :set_recommender, only: [:show, :edit, :update, :destroy]

  # GET /recommenders
  # GET /recommenders.json
  def index
    @recommenders = Recommender.all
  end

  # GET /recommenders/1
  # GET /recommenders/1.json
  def show
  end

  # GET /recommenders/new
  def new
    @recommender = Recommender.new
  end

  # GET /recommenders/1/edit
  def edit
  end

  # POST /recommenders
  # POST /recommenders.json
  def create
    @recommender = Recommender.new(recommender_params)

    respond_to do |format|
      if @recommender.save
        format.html { redirect_to @recommender, notice: 'Recommender was successfully created.' }
        format.json { render :show, status: :created, location: @recommender }
      else
        format.html { render :new }
        format.json { render json: @recommender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommenders/1
  # PATCH/PUT /recommenders/1.json
  def update
    respond_to do |format|
      if @recommender.update(recommender_params)
        format.html { redirect_to @recommender, notice: 'Recommender was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommender }
      else
        format.html { render :edit }
        format.json { render json: @recommender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommenders/1
  # DELETE /recommenders/1.json
  def destroy
    @recommender.destroy
    respond_to do |format|
      format.html { redirect_to recommenders_url, notice: 'Recommender was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommender
      @recommender = Recommender.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommender_params
      params.require(:recommender).permit(:first_name, :last_name, :desc)
    end
end
