module Ak
  class PagesRepository
    def initialize(adapter: YmlAdapter.new(ymls_dir_path: 'db/'))
      @adapter = adapter
    end

    def biography(language:)
      data_for_page(:biography, language: language)
    end

    def contact(language:)
      data_for_page(:contact, language: language)
    end

    def add(page_id, page)
      @adapter.add_data(page_id, data: page.to_h)
    end

    def clear
      @adapter.clear(:biography)
      @adapter.clear(:contact)
    end

    private

    def data_for_page(page, language:)
      data = @adapter.load_data(page, language: language)[0]
      Page.new(data)
    end
  end
end