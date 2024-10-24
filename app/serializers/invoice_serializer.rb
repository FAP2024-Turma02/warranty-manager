class InvoiceSerializer < ApplicationSerializer
  def self.call(invoice)
    return { error: 'Invoice not found' } if invoice.nil?

    {
      id: invoice.id,
      user_id: invoice.user_id,
      invoice_number: invoice.invoice_number,
      purchase_date: invoice.purchase_date,
      issue_date: invoice.issue_date,
      pdf_url: pdf_url(invoice)
    }
  end

  private

  def self.pdf_url(invoice)
    return nil unless invoice.pdf.attached?

    Rails.application.routes.url_helpers.rails_blob_url(invoice.pdf, host: 'localhost:3000')
  end
end
