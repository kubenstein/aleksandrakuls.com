module Ak
  class ConcertsRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all(language:)
      data = @adapter.load_data(:concerts, language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Concert)
    end
  end
end