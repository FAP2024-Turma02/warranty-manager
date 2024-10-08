class AddInvoiceIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :products, :invoices, column: :invoice_id
  end
end
