class RemoveDuplicateInvoice < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :invoice_id
  end
end
