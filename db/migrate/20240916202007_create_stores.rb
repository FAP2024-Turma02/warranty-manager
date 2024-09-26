class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name, limit: 45
      t.string :contact, limit: 45
      t.string :address, limit: 45

      t.timestamps
    end
  end
end
