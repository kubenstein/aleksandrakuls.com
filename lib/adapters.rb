module Adapters
  def self.default
    YmlAdapter.new(ymls_dir_path: 'db/')
  end

  module Adapterable
    def load_data(resources_name, language:)
    end

    def clear(resources_name)
    end

    def add_data(resources_name, data:)
    end
  end
end