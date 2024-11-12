class RemoveDuplicateInvoiceInProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :invoices_id
    remove_column :products, :invoice_id
    add_reference :products, :invoice, null: false, foreign_key: true, index: true
  end
end
