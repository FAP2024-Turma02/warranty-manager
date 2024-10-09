class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @invoices = Invoice.all
    render json: @invoices.map { |invoice| InvoiceSerializer.new(invoice).serialize }
  end

  def show
    render json: InvoiceSerializer.new(@invoice).serialize
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def record_not_found
    render json: { error: 'Invoice not found' }, status: :not_found
  end
end
