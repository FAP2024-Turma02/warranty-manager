class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :email_already_exists

  private

  def record_not_found(exception)
    model_name = exception.model.constantize.model_name.human
    render json: { error: I18n.t('errors.not_found', model: model_name) }, status: :not_found
  end

  def email_already_exists(exception)
    if exception.record.errors.details[:email].any? { |error| error[:error] == :taken }
      render json: { error: I18n.t('errors.email_already_exists') }, status: :unprocessable_entity
    else
      render json: { error: exception.message }, status: :unprocessable_entity
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :name])
  end
end
