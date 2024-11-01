class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  before_action :authenticate_user!, unless: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private

  def record_not_found(exception)
    model_name = exception.model.constantize.model_name.human
    render json: { error: I18n.t('errors.not_found', model: model_name) }, status: :not_found
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    render json: { error: I18n.t("errors.#{policy_name}.#{exception.query}") },
           status: :forbidden
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :name])
  end
end
