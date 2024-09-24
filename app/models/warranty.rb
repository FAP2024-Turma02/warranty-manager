class Warranty < ApplicationRecord
    validates :warranty_number, :issue_date, :expirity_date, :validity_period, presence: true

    belongs_to -> :product
  end
