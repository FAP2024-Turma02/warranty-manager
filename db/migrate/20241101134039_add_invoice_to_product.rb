class AddInvoiceToProduct < ActiveRecord::Migration[7.0]
  remove_column :products, :invoice_id
  add_reference :products, :invoice, null: false, foreign_key: true, index: true
end
