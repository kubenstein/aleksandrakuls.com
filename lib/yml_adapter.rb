class YmlAdapter
  def load_data(resources_name, language:)
    data = YAML::load_file("db/#{resources_name}.yml")
    data[language.to_s]
  end

  def clear(resources_name)
    raise NotImplementedError
  end

  def add_data(resources_name, data:)
    raise NotImplementedError
  end
end