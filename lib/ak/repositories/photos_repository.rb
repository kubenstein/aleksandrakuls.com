module Ak
  class PhotosRepository < CommonRepository
    def initialize(adapter: CommonRepository::default_adapter)
      super(adapter: adapter, resource_name: :gallery, entity: Photo)
    end
  end
end