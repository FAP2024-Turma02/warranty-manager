# db/seeds/invoices.rb
users_with_invoices = User.limit(7)
invoice_numbers = (1..100).map { |i| "INV#{i.to_s.rjust(4, '0')}" }

invoice_numbers.each do |invoice_number|
  unless Invoice.exists?(invoice_number: invoice_number)
    user = users_with_invoices.sample

    invoice = Invoice.new(
      invoice_number: invoice_number,
      purchase_date: Date.today - rand(10..30),
      issue_date: Date.today - rand(5..9),
      user_id: user.id
    )

    pdf_path = Rails.root.join('tmp', 'invoice.pdf')

    if File.exist?(pdf_path)
      invoice.pdf.attach(io: File.open(pdf_path), filename: 'invoice.pdf', content_type: 'application/pdf')
      
      if invoice.save
        puts I18n.t('seed.invoices.success', invoice_number: invoice_number, user_id: user.id)
      else
        puts I18n.t('seed.invoices.error', message: invoice.errors.full_messages.join(', '))
      end
    else
      puts I18n.t('seed.invoices.error', message: "PDF file not found: #{pdf_path}")
    end
  else
    puts I18n.t('seed.invoices.already_exists', invoice_number: invoice_number)
  end
end
