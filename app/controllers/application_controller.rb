class ApplicationController < ActionController::API
  #include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit::Authorization

  rescue_from ActiveRecord::RecordNotFound, with: record_not_found

  private 

  def record_not_found
    render json: { error: 'Product not found'}, status: :not_found
  end
end
