class Product < ApplicationRecord

    validates :name, presence: true, length: { maximum: 45 }
    validates :price, presence: true
    validates :serial_number, presence: true
    validates :warranty_expiry_date, presence: true
    validates :invoice_id, presence: true
    validates :store_id, presence: true

end
