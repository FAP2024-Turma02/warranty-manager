# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Seed para o usuário administrador
User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  confirmed_at: Time.parse("2024-10-28T12:00:00Z"),
  role: 1,         # Assumindo que o papel 1 representa o admin
  admin: true,     # Define como administrador
  uid: "admin@example.com",
  provider: "email"
)

# Seed para um usuário normal
User.create!(
  name: "Regular User",
  email: "user@example.com",
  password: "password123",
  password_confirmation: "password123",
  confirmed_at: Time.current,
  role: 0,         # Assumindo que o papel 0 representa um usuário normal
  admin: false,    # Não é administrador
  uid: "user@example.com",
  provider: "email"
)
