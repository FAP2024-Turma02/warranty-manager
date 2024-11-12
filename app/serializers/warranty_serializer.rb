class WarrantySerializer < ApplicationSerializer
  def self.call(warranty)
    {
      id: warranty.id,
      warranty_number: warranty.warranty_number,
      issue_date: warranty.issue_date,
      expirity_date: warranty.expirity_date,
      validity_period: warranty.validity_period
    }
  end
end
