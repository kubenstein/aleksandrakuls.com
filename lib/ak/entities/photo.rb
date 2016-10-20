module Ak
  class Photo < Entity
    attr_accessor :title, :file_name, :language

    def initialize(title:, file_name:, language:)
      @title = title
      @file_name = file_name
      @language = language
    end
  end
end