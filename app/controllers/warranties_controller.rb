class WarrantiesController < ApplicationController

  # Lista todas as warranties
  def index
    @warranties = Warranty.all
    render json: @warranties
  end

  # Exibe uma warranty específica
  def show
    render json: warranty
  end

  private

  def warranty
    @warranty ||= Warranty.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Warranty not found' }, status: :not_found
  end
end
