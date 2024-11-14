class Invoice < ApplicationRecord
  has_one_attached :pdf
  belongs_to :user
  belongs_to :product
  has_many :product

  validates :invoice_number, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "deve conter apenas letras e números!" }
  validates :purchase_date, presence: true
  validates :issue_date, presence: true
  validates :pdf, presence: true
  validates :user_id, presence: true
end
