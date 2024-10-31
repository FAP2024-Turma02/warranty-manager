class InvoicesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invoice, only: [:show, :update]
  after_action :verify_authorized, except: :index
  
  def index
    @invoices = policy_scope(Invoice)
    render json: @invoices.map { |invoice| InvoiceSerializer.call(invoice) }
  end

  def show
    authorize @invoice
    render json: InvoiceSerializer.call(@invoice)
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)
    authorize @invoice

    if @invoice.save
      render json: InvoiceSerializer.call(@invoice), status: :created
    else
      render json: { errors: @invoice.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @invoice
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
    params.require(:invoice).permit(:invoice_number, :purchase_date, :issue_date, :pdf)
  end
end
