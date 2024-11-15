class ProductSerializer < ApplicationSerializer
  def self.call(product)
    return { error: 'Product not found' } if product.nil?
    {
      id: product.id,
      name: product.name,
      description: product.description,
      category: product.category,
      price: product.price,
      serial_number: product.serial_number,
      warranty_expiry_date: product.warranty_expiry_date,
      invoice_id: product.invoice_id,
    }
  end

end
