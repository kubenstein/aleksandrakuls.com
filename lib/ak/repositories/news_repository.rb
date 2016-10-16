module Ak
  class NewsRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all(language:)
      data = @adapter.load_data(:news, language: language)
      DataCaster.new.cast_to_entity(data: data, entity: News)
    end
  end
end