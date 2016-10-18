module Ak
  class ConcertsRepository
    def initialize(adapter: YmlAdapter.new(ymls_dir_path: 'db/'))
      @adapter = adapter
    end

    def all(language:)
      raw_data = @adapter.load_data(:concerts, language: language)
      raw_data.map { |data| Concert.new(data) }
    end

    def add(concert)
      @adapter.add_data(:concerts, data: concert.to_h)
    end

    def clear
      @adapter.clear(:concerts)
    end
  end
end