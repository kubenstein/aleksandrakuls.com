class YmlLoader
  def initialize(resource:)
    @resource = resource
  end

  def load_data(language:)
    data = YAML::load_file("db/#{@resource}.yml")
    data[language.to_s]
  end
end