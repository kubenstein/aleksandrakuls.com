module Ak
  class ConcertsRepository < CommonRepository
    def initialize(adapter: Adapter::default)
      super(adapter: adapter, resource_name: :concerts, entity: Concert)
    end
  end
end