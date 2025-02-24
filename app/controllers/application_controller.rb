class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Require login for all pages except Devise
  # Allow login and sign-up pages to be accessed without authentication
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
  end
end
