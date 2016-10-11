module Ak
  class PagesRepository
    def biography(language:)
      data_for_page(:biography, language: language)
    end

    def contact(language:)
      data_for_page(:contact, language: language)
    end

    private

    def data_for_page(page, language:)
      data = YmlLoader.new(resource: page)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Page)
    end
  end
end