module Ak
  class ReviewsRepository < CommonRepository
    def initialize(adapter: Adapters.default)
      super(adapter: adapter, resource_name: :reviews, entity: Review)
    end
  end
end
