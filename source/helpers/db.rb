def db
  @db ||= begin
    data_source = InlineDataDb.new(yml_file_paths: 'source/{views,pages}/**/_*')
    partial_localized_data = data_source.data[current_lang.to_s]
    page_localized_data = current_page.data[current_lang.to_s]
    RecursiveOpenStruct.new(partial_localized_data.merge(page_localized_data), recurse_over_arrays: true)
  end
end