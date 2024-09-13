class User < ApplicationRecord

  enum role: {user: 0, admin: 1}

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "Utilize somente letras" } 
  # Include default devise modules. Others available are: 
  # :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,  
         :registerable,
         :recoverable, 
         :rememberable,  
         :validatable,
         :confirmable,
         :lockable

  


end
