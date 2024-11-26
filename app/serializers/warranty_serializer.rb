class WarrantySerializer
  def self.call(warranty)
    {
      id: warranty.id,
      warranty_number: warranty.warranty_number,
      issue_date: warranty.issue_date,
      expirity_date: warranty.expirity_date,
      validity_period: warranty.validity_period,
      product_id: warranty.product_id,
      product_name: warranty.product.name,
      active: warranty.expirity_date > Time.zone.now,
      created_at: warranty.created_at,
      updated_at: warranty.updated_at
    }
  end
end
