class Api::V1::RegistrationsController < Api::BaseApiController
  
  respond_to :json
  
  def create
    user = User.new(params.permit(:email, :password, :password_confirmation))
    if user.save
      render :json=> user.as_json(:id=>user.id, :auth_token=>user.authentication_token, :email=>user.email), :status=>201
      return
    else
      warden.custom_failure!
      render :json=> user.errors, :status=>422
    end
  end
end
