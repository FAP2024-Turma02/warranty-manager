class AddConstraintsToProductsAndStores < ActiveRecord::Migration[7.0]
  def change
    change_column_null :stores, :name, false
    change_column_null :stores, :contact, false
    change_column_null :stores, :address, false
    end
end

