def db
  @db ||= begin
    data_source = InlineDataDb.new(yml_file_paths: 'source/{views,pages}/**/_*')
    partial_localized_data = data_source.data[current_lang.to_s]
    page_localized_data = current_page.data[current_lang.to_s]
    localized_data = partial_localized_data.merge(page_localized_data)

    JSON.parse(localized_data.to_json, object_class: OpenStruct)
  end
end