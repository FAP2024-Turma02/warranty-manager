class WarrantiesController < ApplicationController
    before_action :set_warranty, only: :show

    # Lista todas as warranties
    def index
      @warranties = Warranty.all
      render json: @warranties
    end
  
    # Exibe uma warranty específica
    def show
        render json: @warranty
      end
    
      private
    
      def set_warranty
        @warranty = Warranty.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Warranty not found" }, status: :not_found
      end
  end
