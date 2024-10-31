class ApplicationController < ActionController::API
  #include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(exception)
    model_name = exception.model.constantize.model_name.human
    render json: { error: I18n.t('errors.not_found', model: model_name) }, status: :not_found
  end
  
end
