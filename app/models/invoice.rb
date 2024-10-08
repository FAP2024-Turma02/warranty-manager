class Invoice < ApplicationRecord
  has_one_attached :pdf

  validates :invoice_number, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "deve conter apenas letras e números!" }
  validates :purchase_date, presence: true
  validates :issue_date, presence: true
  validates :pdf, presence: true

  has_many :product
end
