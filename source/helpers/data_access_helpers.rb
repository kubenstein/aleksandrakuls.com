def news
  Ak::NewsRepository.new.all(language: current_lang)
end

def concerts
  Ak::ConcertsRepository.new.all(language: current_lang)
end

def gallery_photos
  Ak::PhotosRepository.new.all_for_gallery(language: current_lang)
end

def music_list
  Ak::MusicRepository.new.all(language: current_lang)
end

def reviews
  Ak::ReviewsRepository.new.all(language: current_lang)
end

def page_data(page)
  repo = Ak::PagesRepository.new
  repo.public_send(page, language: current_lang)
end
