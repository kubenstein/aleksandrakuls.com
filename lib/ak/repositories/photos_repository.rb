module Ak
  class PhotosRepository
    def initialize(adapter: YmlLoader.new)
      @adapter = adapter
    end

    def all_for_gallery(language:)
      raw_data = @adapter.load_data(:gallery, language: language)
      raw_data.map { |data| Photo.new(data) }
    end

    def add_to_gallery(photo)
      @adapter.add_data(:gallery, data: photo.to_h)
    end

    def clear
      @adapter.clear(:gallery)
    end
  end
end