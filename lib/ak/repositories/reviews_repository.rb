module Ak
  class ReviewsRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all(language:)
      data = @adapter.load_data(:reviews, language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Review)
    end
  end
end