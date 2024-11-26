class Store < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, :address, :contact, presence: true
  validates :contact, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Digite um endereço de e-mail válido' }
end
