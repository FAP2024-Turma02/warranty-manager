class AddForeignKeyToProducts < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :products, :stores
  end
end
