module Ak
  class MusicRepository < CommonRepository
    def initialize(adapter: CommonRepository::default_adapter)
      super(adapter: adapter, resource_name: :music, entity: Music)
    end
  end
end