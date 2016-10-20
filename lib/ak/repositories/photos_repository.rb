module Ak
  class PhotosRepository < CommonRepository
    def initialize(adapter: Adapters::default)
      super(adapter: adapter, resource_name: :gallery, entity: Photo)
    end
  end
end