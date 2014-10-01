class Api::RegistrationsController < Api::BaseApiController
  
  respond_to :json
  
  def create
    user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if user.save
      render :json=> user.as_json(:auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
end
