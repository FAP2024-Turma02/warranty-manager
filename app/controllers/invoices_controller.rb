class InvoicesController < ApplicationController
    before_action :set_invoice, only: :show
  
    def index
      @invoices = Invoice.all
      render json: @invoices
    end
  
    def show
      render json: @invoice
    end
  
    private
  
    def set_invoice
      @invoice = Invoice.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Invoice not found" }, status: :not_found
    end
end
