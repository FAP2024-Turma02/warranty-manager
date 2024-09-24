class AddNotNullConstraintsToWarranties < ActiveRecord::Migration[7.0]
  def change
    change_column_null :warranties, :warranty_number, false
    change_column_null :warranties, :issue_date, false
    change_column_null :warranties, :expirity_date, false
    change_column_null :warranties, :validity_period, false
  end
end
