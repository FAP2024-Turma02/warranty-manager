module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  end

  private

  def record_not_found(exception)
    model_name = exception.model.constantize.model_name.human
    render json: { error: I18n.t('errors.not_found', model: model_name) }, status: :not_found
  end

  def render_deletion_message(model_name)
    render json: { message: I18n.t('default_messages.deleted', model: model_name) }, status: :ok
  end

  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    action = exception.query.to_s.chomp('?')
    model_name = exception.record.class.model_name.human.downcase
    render json: { error: I18n.t("default_permission_errors.#{action}", model: model_name) }, status: :forbidden
  end
end
