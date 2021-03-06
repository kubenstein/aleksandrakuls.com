require 'yaml'

class YmlAdapter
  include Adapters::Adapterable

  def initialize(ymls_dir_path:)
    @ymls_dir_path = ymls_dir_path
  end

  def load_data(resources_name, conditions:)
    language = conditions[:language]
    collection = YAML.load_file("#{@ymls_dir_path}#{resources_name}.yml")
    collection[language.to_s].map do |item|
      symbolize_keys(
        item.merge(language: language)
      )
    end
  end

  def clear(_resources_name)
    raise NotImplementedError
  end

  def add_data(_resources_name, _data:)
    raise NotImplementedError
  end

  private

  def symbolize_keys(hash)
    hash.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
  end
end
