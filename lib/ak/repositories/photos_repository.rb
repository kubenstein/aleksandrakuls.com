module Ak
  class PhotosRepository < CommonRepository
    def initialize(adapter: Adapter::default)
      super(adapter: adapter, resource_name: :gallery, entity: Photo)
    end
  end
end