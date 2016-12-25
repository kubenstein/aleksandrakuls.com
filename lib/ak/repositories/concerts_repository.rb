module Ak
  class ConcertsRepository < CommonRepository
    def initialize(adapter: Adapters.remote_data_adapter)
      super(adapter: adapter, resource_name: :concerts, entity: Concert)
    end

    def all(language:)
      super.sort { |e1, e2| e2.date <=> e1.date }
    end
  end
end
