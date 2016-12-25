module Ak
  class MusicRepository < CommonRepository
    def initialize(adapter: Adapters.local_data_adapter)
      super(adapter: adapter, resource_name: :music, entity: Music)
    end
  end
end
