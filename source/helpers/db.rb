def db
  @db ||= begin
    partial_localized_data = InlineDataDb.new.data[current_lang.to_s]
    page_localized_data = current_page.data[current_lang.to_s]
    RecursiveOpenStruct.new(partial_localized_data.merge(page_localized_data), recurse_over_arrays: true)
  end
end