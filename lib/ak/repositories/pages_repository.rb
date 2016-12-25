module Ak
  class PagesRepository
    def initialize(adapter: Adapters.local_data_adapter)
      @adapter = adapter
    end

    def biography(language:)
      data_for_page(:biography, conditions: { language: language })
    end

    def contact(language:)
      data_for_page(:contact, conditions: { language: language })
    end

    def add(page_id, page)
      @adapter.add_data(page_id, data: page.to_h)
    end

    def clear
      @adapter.clear(:biography)
      @adapter.clear(:contact)
    end

    private

    def data_for_page(page_id, conditions:)
      data = @adapter.load_data(page_id, conditions: conditions)[0]
      if data.nil?
        Page.new(language: conditions[:language], text: '')
      else
        Page.new(data)
      end
    end
  end
end
