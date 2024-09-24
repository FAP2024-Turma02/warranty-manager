class Warranty < ApplicationRecord
    belongs_to :product
  
    validates :warranty_number, :issue_date, :expirity_date, :validity_period,
               presence: true
  end
  
