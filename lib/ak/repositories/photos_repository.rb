module Ak
  class PhotosRepository
    def all_for_gallery(language:)
      data = YmlLoader.new(resource: :gallery)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Photo)
    end
  end
end