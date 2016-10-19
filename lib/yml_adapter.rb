require 'yaml'

class YmlAdapter
  include Adapter::Adapterable

  def initialize(ymls_dir_path:)
    @ymls_dir_path = ymls_dir_path
  end

  def load_data(resources_name, language:)
    data = YAML::load_file("#{@ymls_dir_path}#{resources_name}.yml")
    data[language.to_s]
  end

  def clear(resources_name)
    raise NotImplementedError
  end

  def add_data(resources_name, data:)
    raise NotImplementedError
  end
end