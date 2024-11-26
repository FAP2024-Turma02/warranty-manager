puts 'Seeding Invoices...'

users_with_invoices = User.limit(7)
invoice_numbers = (1..50).map { |i| "INV#{i.to_s.rjust(4, '0')}" }

invoice_numbers.each do |invoice_number|
  if Invoice.exists?(invoice_number:)
    puts I18n.t('seed.invoices.already_exists', invoice_number:)
  else
    user = users_with_invoices.sample

    purchase_date = Date.today - rand(10..30)
    issue_date = purchase_date + rand(0..1)

    invoice = Invoice.new(
      invoice_number:,
      purchase_date:,
      issue_date:,
      user_id: user.id
    )

    pdf_path = Rails.root.join('lib', 'assets', 'invoice.pdf')

    if File.exist?(pdf_path)
      invoice.pdf.attach(io: File.open(pdf_path), filename: 'invoice.pdf', content_type: 'application/pdf')

      if invoice.save
        puts I18n.t('seed.invoices.success', invoice_number:, user_id: user.id)
      else
        puts I18n.t('seed.invoices.error', message: invoice.errors.full_messages.join(', '))
      end
    else
      puts I18n.t('seed.invoices.error', message: "PDF file not found: #{pdf_path}")
    end
  end
end
