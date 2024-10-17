class InvoiceSerializer
    def initialize(invoice)
      @invoice = invoice
    end
  
    def serialize
      {
        id: @invoice.id,
        user_id: @invoice.user_id,
        invoice_number: @invoice.invoice_number,
        purchase_date: @invoice.purchase_date,
        issue_date: @invoice.issue_date,
        pdf_url: pdf_url
      }
    end
  
    private
  
    def pdf_url
      return nil unless @invoice.pdf.attached?
  
      Rails.application.routes.url_helpers.rails_blob_url(@invoice.pdf, host: 'localhost:3000')
    end
  end
    