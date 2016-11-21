module Adapters
  def self.default
    @default_adapter ||= YmlAdapter.new(ymls_dir_path: 'db/')
  end

  def self.default=(adapter)
    @default_adapter = adapter
  end

  module Adapterable
    def load_data(resources_name, conditions:)
    end

    def clear(resources_name)
    end

    def add_data(resources_name, data:)
    end
  end
end
