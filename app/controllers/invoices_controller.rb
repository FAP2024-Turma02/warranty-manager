class InvoicesController < ApplicationController
  def index
    authorize Invoice
    @q = policy_scope(Invoice).ransack(params[:q]) # Integração com Ransack
    @invoices = @q.result

    render json: @invoices.map { |invoice| InvoiceSerializer.call(invoice) }
  end

  def show
    authorize invoice
    render json: InvoiceSerializer.call(invoice)
  end

  def create
    authorize Invoice
    @invoice = current_user.invoices.create!(invoice_params)

    render json: InvoiceSerializer.call(@invoice), status: :created
  end

  def update
    authorize invoice
    invoice.update!(invoice_params)

    render json: InvoiceSerializer.call(invoice), status: :ok
  end

  def destroy
    authorize invoice
    invoice.destroy

    head :no_content
  end

  private

  def invoice
    @invoice ||= Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:invoice_number, :purchase_date, :issue_date, :pdf)
  end
end
