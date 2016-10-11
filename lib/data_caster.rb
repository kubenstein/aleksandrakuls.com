class DataCaster
  def cast_to_entity(data:, entity: OpenStruct)
    JSON.parse(data.to_json, object_class: entity)
  end
end