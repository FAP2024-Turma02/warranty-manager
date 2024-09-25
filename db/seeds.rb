# db/seeds.rb

# Limpa todos os usuários existentes (opcional)
User.destroy_all

# Cria um usuário de teste
User.create!(
  email: 'test@example.com',
  password: 'password123',
  password_confirmation: 'password123',
  name: 'TestUser',
  role: 'user',
  admin: false,
  provider: 'email',
  confirmed_at: Time.now  # Se você estiver usando confirmable
)

puts "Usuário de teste criado com sucesso!"
