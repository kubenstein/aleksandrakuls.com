module Ak
  class MusicRepository < CommonRepository
    def initialize(adapter: Adapter::default)
      super(adapter: adapter, resource_name: :music, entity: Music)
    end
  end
end