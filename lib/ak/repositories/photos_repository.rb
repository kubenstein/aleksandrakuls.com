module Ak
  class PhotosRepository < CommonRepository
    def initialize(adapter: Adapters.local_data_adapter)
      super(adapter: adapter, resource_name: :gallery, entity: Photo)
    end
  end
end
