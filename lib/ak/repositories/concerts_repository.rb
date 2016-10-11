module Ak
  class ConcertsRepository
    def all(language:)
      data = YmlLoader.new(resource: :concerts)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: Concert)
    end
  end
end