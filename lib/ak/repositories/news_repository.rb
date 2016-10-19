module Ak
  class NewsRepository < CommonRepository
    def initialize(adapter: Adapter::default)
      super(adapter: adapter, resource_name: :news, entity: News)
    end
  end
end