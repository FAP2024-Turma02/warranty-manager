class ApplicationController < ActionController::API
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization
  include LocaleHandler
  include ErrorHandler

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :name])
  end
end
