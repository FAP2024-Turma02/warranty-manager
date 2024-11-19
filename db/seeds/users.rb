
puts "Seeding Users..."
users_data = [
  { name: 'Joao Borbosa', email: 'jbarbosa@example.com', password: 'password', role: 'admin', admin: 1 },
  { name: 'Jose de Arimateia', email: 'jarimateia@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Marina Aragao', email: 'maragao@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Roberto Freitas', email: 'rfreitas@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Josefa Perreira', email: 'jperreira@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Frederico Evandro', email: 'fevandro@example.com', password: 'password', role: 'admin', admin: 1 },
  { name: 'Sivirino Valentin', email: 'svalentin@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Raimunda Ferreira', email: 'rferreira@example.com', password: 'password', role: 'user', admin: 1 },
  { name: 'Manuel da Silva', email: 'msilva@example.com', password: 'password', role: 'admin', admin: 0 },
  { name: 'Eduardo Costa', email: 'ecosta@example.com', password: 'password', role: 'admin', admin: 1 }
]

users_data.each do |user_data|
  unless User.exists?(email: user_data[:email])
    user = User.new(
      email: user_data[:email],
      name: user_data[:name],
      password: user_data[:password],
      uid: user_data[:email], 
      provider: 'email',
      role: user_data[:role],
      admin: user_data[:admin],
      confirmed_at: Time.current  
    )

    if user.save
      puts I18n.t('seed.users.success', email: user.email)
    else
      puts I18n.t('seed.users.error', message: user.errors.full_messages.join(', '))
    end
  else
    puts I18n.t('seed.users.already_exists', email: user_data[:email])
  end
end
