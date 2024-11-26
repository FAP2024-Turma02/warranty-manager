class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 45 }
  validates_presence_of :price, :serial_number, :warranty_expiry_date, :invoice_id, :store_id

  has_many :warranty
  belongs_to :store
  belongs_to :invoice
end
