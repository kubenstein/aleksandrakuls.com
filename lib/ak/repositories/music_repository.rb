module Ak
  class MusicRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all(language:)
      data = @adapter.load_data(:music, language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Music)
    end
  end
end