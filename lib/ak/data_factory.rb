module Ak
  class DataFactory
    @additional_options = {}

    def self.additional_options=(params)
      @additional_options = params
    end

    def self.additional_options
      @additional_options
    end

    def initialize(current_lang:)
      @current_lang = current_lang
    end

    def news
      Ak::NewsRepository.new(options).all(language: @current_lang)
    end

    def concerts
      Ak::ConcertsRepository.new(options).all(language: @current_lang)
    end

    def gallery_photos
      Ak::PhotosRepository.new(options).all(language: @current_lang)
    end

    def music_list
      Ak::MusicRepository.new(options).all(language: @current_lang)
    end

    def reviews
      Ak::ReviewsRepository.new(options).all(language: @current_lang)
    end

    def page_data(page)
      Ak::PagesRepository.new(options).public_send(page, language: @current_lang)
    end

    private

    def options
      self.class.additional_options
    end
  end
end