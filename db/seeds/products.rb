puts 'Seeding Products...'

stores = Store.all
invoices = Invoice.all

products_data = (1..100).map do |i|
  category = case i % 6
             when 0 then 'eletronico'
             when 1 then 'eletrodomestico'
             when 2 then 'móvel'
             when 3 then 'moto'
             when 4 then 'automovel'
             when 5 then 'livro e revista'
             end

  warranty_period = case category
                    when 'livro e revista', 'móvel' then 3
                    when 'eletronico', 'eletrodomestico' then 12
                    when 'automovel', 'moto' then 24
                    end

  invoice = invoices.sample
  {
    name: "Produto #{i}",
    description: "Descrição do produto #{i}",
    category:,
    price: rand(10..1000).to_f,
    serial_number: "#{i.to_s.rjust(15, '0')}",
    warranty_expiry_date: invoice.issue_date + warranty_period.months,
    store: stores.sample,
    invoice:
  }
end

products_data.each do |product_data|
  if Product.exists?(serial_number: product_data[:serial_number])
    puts I18n.t('seed.products.already_exists', serial_number: product_data[:serial_number])
  else
    product = Product.new(product_data)
    if product.save
      puts I18n.t('seed.products.success', serial_number: product.serial_number)
    else
      puts I18n.t('seed.products.error', message: product.errors.full_messages.join(', '))
    end
  end
end
