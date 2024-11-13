puts "Seeding Warranties..."

products = Product.all

warranty_data = (1..50).map do |i|
  product = products.sample

  if product
    issue_date = product.warranty_expiry_date + 1.day
    warranty_period = case product.category
                      when 'livro e revista', 'móvel' then 3
                      when 'eletronico', 'eletrodomestico' then 12
                      when 'automovel', 'moto' then 24
                      end
    expirity_date = issue_date + warranty_period.months
  else
    issue_date = Date.today - rand(1..365)
    expirity_date = issue_date + rand(6..48).months
  end

  {
    warranty_number: "WAR#{i.to_s.rjust(4, '0')}",
    issue_date: issue_date,
    expirity_date: expirity_date,
    validity_period: (expirity_date - issue_date).to_i / 30,
    product: product
  }
end

warranty_data.each do |warranty_data|
  unless Warranty.exists?(warranty_number: warranty_data[:warranty_number])
    warranty = Warranty.new(warranty_data)
    if warranty.save
      puts I18n.t('seed.warranties.success', warranty_number: warranty.warranty_number)
    else
      puts I18n.t('seed.warranties.error', message: warranty.errors.full_messages.join(', '))
    end
  else
    puts I18n.t('seed.warranties.already_exists', warranty_number: warranty_data[:warranty_number])
  end
end
