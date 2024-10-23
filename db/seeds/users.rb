users_data = [
  { name: 'Joao Ninguem', email: 'zeninguem@example.com', password: 'password', role: 'admin', admin: 1 },
  { name: 'Jose Lezim', email: 'zelezim@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Marina Morena', email: 'marmoreninha@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Bob Esponja', email: 'bob.squarepants@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Josefa Barbosa', email: 'zefinha@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Frederico Evandro', email: 'vela.libra@example.com', password: 'password', role: 'admin', admin: 1 },
  { name: 'Sivirino Valentin', email: 'biu@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Raimunda Ferreira', email: 'mundica@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Manuel da Silva', email: 'maned@example.com', password: 'password', role: 'user', admin: 0 },
  { name: 'Eduardo Costa', email: 'du.dudu.edu@example.com', password: 'password', role: 'admin', admin: 1 }
]

users_data.each do |user_data|
  unless User.exists?(email: user_data[:email])
    User.create!(user_data)
    puts I18n.t('seed.users.success', email: user_data[:email])
  else
    puts I18n.t('seed.users.already_exists', email: user_data[:email])
  end
end

