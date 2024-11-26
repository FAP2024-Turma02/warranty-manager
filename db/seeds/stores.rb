puts 'Seeding Stores...'

stores_data = [
  { name: 'Grillo', contact: 'grillo@gmail.com', address: 'Rua Qualquer, 50, Centro, Recife-PE' },
  { name: 'Cobasi', contact: 'cobasi@gmail.com', address: 'Rua Alvorada, 89, Matriz, Caruaru-PE' },
  { name: 'Segurança Valores', contact: 'seg.valores@gmail.com', address: 'Av. Olavo Bilac, 356, Cajá, Recife-PE' },
  { name: 'Microlite', contact: 'microlite@gmail.com', address: 'Rua Projetada, 45, Curado, Jaboatão-PE' },
  { name: 'Exército Fitness', contact: 'e.fitnes@gmail.com', address: 'Rua Leonardo, 70, Santo, Recife-PE' }
]

stores_data.each do |store_data|
  if Store.exists?(name: store_data[:name])
    puts I18n.t('seed.stores.already_exists', name: store_data[:name])
  else
    store = Store.new(
      name: store_data[:name],
      contact: store_data[:contact],
      address: store_data[:address]
    )

    if store.save
      puts I18n.t('seed.stores.success', name: store.name)
    else
      puts I18n.t('seed.stores.error', message: store.errors.full_messages.join(', '))
    end
  end
end
