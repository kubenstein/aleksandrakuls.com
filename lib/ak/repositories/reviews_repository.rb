module Ak
  class ReviewsRepository < CommonRepository
    def initialize(adapter: Adapter::default)
      super(adapter: adapter, resource_name: :reviews, entity: Review)
    end
  end
end