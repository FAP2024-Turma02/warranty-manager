class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show]

  def index
    @invoices = Invoice.all
    render json: @invoices.map { |invoice| InvoiceSerializer.call(invoice) }
  end

  def show
    render json: InvoiceSerializer.call(@invoice)
  end

  private

  def set_invoice
    @invoice ||= Invoice.find(params[:id])
  end
end
