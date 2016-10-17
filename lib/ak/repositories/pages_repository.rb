module Ak
  class PagesRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def biography(language:)
      data_for_page(:biography, language: language)
    end

    def contact(language:)
      data_for_page(:contact, language: language)
    end

    private

    def data_for_page(page, language:)
      data = @adapter.load_data(page, language: language)[0]
      DataCaster.new.cast_to_entity(data: data.to_h, entity: Page)
    end
  end
end