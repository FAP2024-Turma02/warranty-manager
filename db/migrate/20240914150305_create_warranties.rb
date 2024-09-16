class CreateWarranties < ActiveRecord::Migration[7.0]
  def change
    create_table :warranties do |t|
      t.string :warranty_number
      t.date :issue_date
      t.date :expirity_date
      t.integer :validity_period

      t.timestamps
    end
  end
end
