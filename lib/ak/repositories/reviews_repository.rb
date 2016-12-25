module Ak
  class ReviewsRepository < CommonRepository
    def initialize(adapter: Adapters.local_data_adapter)
      super(adapter: adapter, resource_name: :reviews, entity: Review)
    end
  end
end
