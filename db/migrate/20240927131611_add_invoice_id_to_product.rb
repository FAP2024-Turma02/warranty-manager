class AddInvoiceIdToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :invoices, foreign_key: true, index: true
  end
end
