class PhotosRepository
  def all_for_gallery(language:)
    cast_to_entity(
      load_localized_data(language: language)
    )
  end

  private

  def load_localized_data(language:)
    data = YAML::load_file('source/db/gallery.yml')
    data[language.to_s]
  end

  def cast_to_entity(data)
    JSON.parse(data.to_json, object_class: OpenStruct)
  end
end