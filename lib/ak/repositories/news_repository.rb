module Ak
  class NewsRepository < CommonRepository
    def initialize(adapter: CommonRepository::default_adapter)
      super(adapter: adapter, resource_name: :news, entity: News)
    end
  end
end