def default_lang
  :pl
end

def current_lang
  I18n.locale
end

def localized_path(path, lang=current_lang, _default_lang=default_lang)
  route = path.gsub("#{current_lang}/", '')
  lang == _default_lang ? route : "/#{lang}#{route}"
end
