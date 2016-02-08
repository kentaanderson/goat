class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  before_action :authenticate_user!
  protect_from_forgery with: :exception


# ======== this is supposed to let me update name fields, but errors out
#  before_action :configure_permitted_parameters, if: :devise_controller?

#  protected

#  def configure_permitted_parameters
#	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
#      user_params.permit(:username, :email)
#  	end
#  end
# ======== end name field edit
end
