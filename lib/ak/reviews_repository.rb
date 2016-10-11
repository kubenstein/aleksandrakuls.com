module Ak
  class ReviewsRepository
    def all(language:)
      data = YmlLoader.new(resource: :reviews)
                      .load_data(language: language)
      DataCaster.new.cast_to_entity(data: data, entity: OpenStruct)
    end
  end
end