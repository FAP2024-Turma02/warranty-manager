class StoreSerializer < ApplicationSerializer
    def self.call(store)
      base_data = {
        id: store.id,
        name: store.name,
        address: store.address,
        contact: store.contact
      }
  
      base_data.merge(serialize_timestamps(store))
    end
  
    private
  
    def self.serialize_timestamps(store)
      {
        created_at: store.created_at,
        updated_at: store.updated_at
      }
    end
  end