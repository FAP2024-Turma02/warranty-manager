class User < ApplicationRecord
  has_many :invoices

  enum role: {user: 0, admin: 1 } #Definindo a roles

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :email, length: { maximum: 255 }
  validates :password, length: {maximum: 8 }

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable, 
end