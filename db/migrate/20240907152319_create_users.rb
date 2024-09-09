class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name      
      t.enum :role, default: 0, null: false
      t.boolean :admin,  default: 0, 

      t.timestamps
    end
  end
end
