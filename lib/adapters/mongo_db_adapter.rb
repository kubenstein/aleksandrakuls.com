class MongoDbAdapter
  include Adapters::Adapterable

  def initialize(mongodb_uri:)
    @mongodb_uri = mongodb_uri
  end

  def load_data(resources_name, conditions:)
    language = conditions[:language]
    collection = client[resources_name]
    collection.find.map do |item|
      transform_item(item, language)
    end
  end

  def clear(_resources_name)
    raise NotImplementedError
  end

  def add_data(_resources_name, _data:)
    raise NotImplementedError
  end

  private

  def client
    Mongo::Client.new(@mongodb_uri)
  end

  def transform_item(item, language)
    item = defaultalize_language(item, language)
    item = item.merge(language: language)
    item = symbolize_keys(item)
    item
  end

  def defaultalize_language(item, language)
    language_identifier = language.to_s.upcase
    attributes = item.keys
    attributes.each do |key|
      if key.include?(language_identifier)
        item[key.gsub(language_identifier, '')] = item.delete(key)
      end
    end
    item
  end

  def symbolize_keys(hash)
    hash.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }
  end
end
