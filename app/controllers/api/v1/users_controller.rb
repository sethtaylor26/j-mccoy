class Api::V1::UsersController < Api::BaseApiController
  before_action :set_user, only: [:show, :destroy]

  respond_to :json, :xml

  def index
    @users = User.all
    respond_with @users
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    respond_with User.create(user_params)
  end

  def update
    obj = User.update(params[:id], user_params)
    render json: obj
  end

  def destroy
    respond_with @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.required(:user).permit(:user_id)
    end
end
