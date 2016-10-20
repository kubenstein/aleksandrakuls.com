module Ak
  class PagesRepository
    def initialize(adapter: Adapter::default)
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

    def data_for_page(page_id, language:)
      data = @adapter.load_data(page_id, language: language)[0]
      if data.nil?
        Page.new(language: language)
      else
        Page.new(data)
      end
    end
  end
end