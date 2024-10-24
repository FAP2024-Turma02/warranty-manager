class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :update]
  before_action :authorize_invoice, only: [:create, :update]

  def index
    @invoices = Invoice.all
    render json: @invoices.map { |invoice| InvoiceSerializer.call(invoice) }
  end

  def show
    render json: InvoiceSerializer.call(@invoice)
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: InvoiceSerializer.call(@invoice), status: :created
    else
      render json: { errors: @invoice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      render json: InvoiceSerializer.call(@invoice), status: :ok
    else
      render json: { errors: @invoice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_invoice
    @invoice ||= Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:invoice_number, :purchase_date, :issue_date, :pdf, :user_id)
  end

  def authorize_invoice
    authorize @invoice || Invoice
  end
end
