class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday])
  end
end
