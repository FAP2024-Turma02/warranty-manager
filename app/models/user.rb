class User < ApplicationRecord
  #has_many :invoices

  enum role: {user: 0, admin: 1 }

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "somente letras." }
  validates :email, length: { maximum: 255 }
  validates :password, length: {minimum: 8 }

  # Include default devise modules. Others available are:
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable
end
