class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # Permits devise additional parameters to be permitted without
  # generating devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username])
  end
end
