module Ak
  class MusicRepository
    def all(language:)
      data = YmlLoader.new(resource: :music)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: OpenStruct)
    end
  end
end