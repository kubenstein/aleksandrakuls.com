module Ak
  class ConcertsRepository < CommonRepository
    def initialize(adapter: Adapters::default)
      super(adapter: adapter, resource_name: :concerts, entity: Concert)
    end
  end
end