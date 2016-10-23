def default_lang
  :pl
end

def current_lang
  I18n.locale
end

def localized_path(path, lang=current_lang, default_language=default_lang)
  route = path.gsub("#{current_lang}/", '')
  lang == default_language ? route : "/#{lang}#{route}"
end
