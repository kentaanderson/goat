class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
# before_filter :configure_account_update_params, if: :devise_controller?
 before_filter :configure_permitted_parameters, if: :devise_controller?
# before_filter :configure_permitted_parameters, if: :devise_controller?
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected


 def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  # GOAT added these to capture names as users sign up
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  # why this works for both events is uninvestigated, but it does
    devise_parameter_sanitizer.for(:account_update) { |v| v.permit! }
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
  end

  # If you have extra params to permit, append them to the sanitizer.
#   def configure_sign_up_params
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
#    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
#     devise_parameter_sanitizer.for(:sign_up) << :first_name
#     devise_parameter_sanitizer.for(:sign_up) << :last_name
 #  end

  # If you have extra params to permit, append them to the sanitizer.
  # GOAT added these to capture names as users edit names
  # def configure_account_update_params
# Should ADD "permit" lines here as well
 #    devise_parameter_sanitizer.for(:account_update) << :first_name
#     devise_parameter_sanitizer.for(:account_update) << :last_name
#   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
