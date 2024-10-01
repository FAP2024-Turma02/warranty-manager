class AddStoreReferenceToProducts < ActiveRecord::Migration[7.0]
  def change
    # Verifica se a coluna store_id já existe antes de adicionar a referência
    unless column_exists?(:products, :store_id)
      add_reference :products, :store, null: false, foreign_key: true
    end
  end
end
