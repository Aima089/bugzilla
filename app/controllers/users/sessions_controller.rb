# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end
  def after_sign_in_path_for(resource)
    dashboard_path # or wherever you want to redirect
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # or any other path you want to redirect to after sign-out
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
 def destroy
    super
 end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :password_confirmation, :role])
  end
end
