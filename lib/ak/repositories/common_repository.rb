module Ak
  class CommonRepository
    def initialize(adapter:, entity:, resource_name:)
      @adapter = adapter
      @entity = entity
      @resource_name = resource_name
    end

    def all(language:)
      raw_data = @adapter.load_data(@resource_name,
                                    conditions: { language: language })
      raw_data.map { |data| @entity.new(data) }
    end

    def add(resource)
      @adapter.add_data(@resource_name, data: resource.to_h)
    end

    def clear
      @adapter.clear(@resource_name)
    end
  end
end
