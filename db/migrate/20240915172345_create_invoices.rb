class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_number, null: false
      t.date :purchase_date, null: false
      t.date :issue_date, null: false

      t.timestamps
    end
  end
end
