def news
  data_accessor.news
end

def concerts
  data_accessor.concerts
end

def gallery_photos
  data_accessor.gallery_photos
end

def music_list
  data_accessor.music_list
end

def reviews
  data_accessor.reviews
end

def page_data(page)
  data_accessor.page_data(page)
end

def data_accessor
  Ak::DataFactory.new(current_lang: current_lang)
end
