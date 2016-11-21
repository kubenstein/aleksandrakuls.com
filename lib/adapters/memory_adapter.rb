class MemoryAdapter
  include Adapters::Adapterable

  def load_data(resources_name, conditions:)
    (db[resources_name] ||= [])
      .select { |item| item_meets_conditions?(item, conditions) }
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

  private

  def item_meets_conditions?(item, conditions)
    conditions.keys.each do |condition|
      return false unless item[condition] == conditions[condition]
    end
    true
  end
end
