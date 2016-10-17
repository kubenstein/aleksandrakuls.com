class YmlAdapter
  def load_data(resource, language:)
    data = YAML::load_file("db/#{resource}.yml")
    data[language.to_s]
  end
end