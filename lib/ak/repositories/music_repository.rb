module Ak
  class MusicRepository
    def initialize(adapter: YmlAdapter.new(ymls_dir_path: 'db/'))
      @adapter = adapter
    end

    def all(language:)
      raw_data = @adapter.load_data(:music, language: language)
      raw_data.map { |data| Music.new(data) }
    end

    def add(music)
      @adapter.add_data(:music, data: music.to_h)
    end

    def clear
      @adapter.clear(:music)
    end
  end
end