module Ak
  class Entity
    def to_h
      instance_variables.each_with_object({}) do |var, hash|
        hash[var[1..-1].to_sym] = instance_variable_get(var)
      end
    end
  end
end