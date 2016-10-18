module Ak
  class ReviewsRepository < CommonRepository
    def initialize(adapter: CommonRepository::default_adapter)
      super(adapter: adapter, resource_name: :reviews, entity: Review)
    end
  end
end