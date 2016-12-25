module Ak
  class NewsRepository < CommonRepository
    def initialize(adapter: Adapters.local_data_adapter)
      super(adapter: adapter, resource_name: :news, entity: News)
    end
  end
end
