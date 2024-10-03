class AddInvoiceIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :invoices, column: :invoice_id
  end
end
