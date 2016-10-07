def default_lang
  :pl
end

def current_lang
  @current_lang.to_sym
end

def localized_current_page_path(lang=current_lang, _default_lang=default_lang)
  route = current_page.url.remove("#{current_lang}/")
  lang == _default_lang ? route : "/#{lang}#{route}"
end
