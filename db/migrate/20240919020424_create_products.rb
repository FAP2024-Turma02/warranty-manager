class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null:false, limit: 45
      t.text :description
      t.string :category
      t.float :price, null:false
      t.string :serial_number, null:false
      t.date :warranty_expiry_date, null:false
      t.integer :invoice_id, null:false
      t.integer :store_id, null:false
       
      t.timestamps
    end
  end
end
