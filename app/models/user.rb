class User < ApplicationRecord
  # Inclua os módulos do Devise Token Auth
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable,  
         :registerable,
         :recoverable, 
         :rememberable,  
         :validatable,
         :confirmable,
         :lockable

  enum role: { user: 0, admin: 1 }
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }, 
            format: { with: /\A[a-zA-Z\s]+\z/, message: "Utilize somente letras" } 
end
