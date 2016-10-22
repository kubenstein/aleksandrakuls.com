module Ak
  class DataFactory
    def initialize(current_lang:)
      @current_lang = current_lang
    end

    def news
      Ak::NewsRepository.new.all(language: @current_lang)
    end

    def concerts
      Ak::ConcertsRepository.new.all(language: @current_lang)
    end

    def gallery_photos
      Ak::PhotosRepository.new.all(language: @current_lang)
    end

    def music_list
      Ak::MusicRepository.new.all(language: @current_lang)
    end

    def reviews
      Ak::ReviewsRepository.new.all(language: @current_lang)
    end

    def page_data(page)
      Ak::PagesRepository.new.public_send(page, language: @current_lang)
    end
  end
end