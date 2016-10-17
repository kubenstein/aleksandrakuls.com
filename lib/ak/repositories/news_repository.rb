module Ak
  class NewsRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all(language:)
      raw_data = @adapter.load_data(:news, language: language)
      raw_data.map { |data| News.new(data) }
    end

    def add(news)
      @adapter.add_data(:news, data: news.to_h)
    end

    def clear
      @adapter.clear(:news)
    end
  end
end