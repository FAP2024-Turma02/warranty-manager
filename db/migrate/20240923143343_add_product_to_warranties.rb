class AddProductToWarranties < ActiveRecord::Migration[7.0]
  def change
    add_reference :warranties, :product, null: false, foreign_key: true
  end
end
