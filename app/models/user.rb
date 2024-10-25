class User < ApplicationRecord
 include DeviseTokenAuth::Concerns::User
 has_many :invoices
 
 devise :database_authenticatable, :registerable, :recoverable,
        :rememberable, :validatable, :confirmable, :lockable
  
 enum role: {user: 0, admin: 1}  

 validates :name, presence: true, length: { minimum: 3, maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/, message: "Utilize somente letras" } 
end
