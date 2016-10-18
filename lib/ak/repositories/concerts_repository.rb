module Ak
  class ConcertsRepository < CommonRepository
    def initialize(adapter: CommonRepository::default_adapter)
      super(adapter: adapter, resource_name: :concerts, entity: Concert)
    end
  end
end