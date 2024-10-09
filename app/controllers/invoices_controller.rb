class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @invoices = Invoice.all
    render json: @invoices.map { |invoice| invoice_response(invoice) }
  end

  def show
    render json: invoice_response(@invoice)
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_response(invoice)
    {
      id: invoice.id,
      invoice_number: invoice.invoice_number,
      purchase_date: invoice.purchase_date,
      issue_date: invoice.issue_date,
      pdf_url: url_for(invoice.pdf)
    }
  end

  def record_not_found
    render json: { error: 'Invoice not found' }, status: :not_found
  end
end
