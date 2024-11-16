class WarrantySerializer
    def self.call(warranty)
      {
        id: warranty.id,
        warranty_number: warranty.warranty_number,
        issue_date: warranty.issue_date,
        expirity_date: warranty.expirity_date,
        validity_period: warranty.validity_period,
        product_id: warranty.product_id, # Inclui o ID do produto relacionado
        product_name: warranty.product.name, # Opcional: Nome do produto (se existir no modelo Product)
        active: warranty.expirity_date > Time.zone.now, # Indica se a garantia ainda está ativa
        created_at: warranty.created_at,
        updated_at: warranty.updated_at
      }
    end
  end
  