puts '== Routes:'
RoutesUtils::paths.each do |path_helper_name, route|
  puts "\t#{path_helper_name} => #{route}"
  define_method(path_helper_name) do |lang=current_lang, _default_lang=default_lang|
    lang == _default_lang ? route : "/#{lang}#{route}"
  end
end