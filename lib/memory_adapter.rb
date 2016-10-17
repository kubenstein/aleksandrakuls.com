class MemoryAdapter
  def load_data(resources_name, language:)
    (db[resources_name] ||= [])
      .select { |item| item[:language] == language }
  end

  def clear(resources_name)
    db[resources_name] = []
  end

  def add_data(resources_name, data:)
    (db[resources_name] ||= []) << data
  end

  def db
    @db ||= {}
  end
end