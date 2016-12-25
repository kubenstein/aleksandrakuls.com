module Adapters
  def self.local_data_adapter
    @lda ||= YmlAdapter.new(ymls_dir_path: 'db/')
  end

  def self.remote_data_adapter
    @rda ||= MongoDbAdapter.new(mongodb_uri: ENV.fetch('MONGODB_URI'))
  end

  def self.local_data_adapter=(adapter)
    @lda = adapter
  end

  def self.remote_data_adapter=(adapter)
    @rda = adapter
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
