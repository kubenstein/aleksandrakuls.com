def default_lang
  :pl
end

def current_lang
  @current_lang.to_sym
end

def db
  @db ||= begin
    partial_localized_data = PartialFrontmatter.new.collect_data[current_lang.to_s]
    page_localized_data = current_page.data[current_lang.to_s]
    RecursiveOpenStruct.new(partial_localized_data.merge(page_localized_data))
  end
end