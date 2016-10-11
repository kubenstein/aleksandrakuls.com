module Ak
  class NewsRepository
    def all(language:)
      data = YmlLoader.new(resource: :news)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: News)
    end
  end
end