module Ak
  class Page < Entity
    attr_accessor :text, :language

    def initialize(text: '', language:)
      @text = text
      @language = language
    end
  end
end