module Ak
  class PhotosRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all_for_gallery(language:)
      data = @adapter.load_data(:gallery, language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Photo)
    end
  end
end