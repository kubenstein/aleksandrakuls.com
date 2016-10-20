module Ak
  class Page
    include ToHashable

    attr_accessor :text, :language

    def initialize(text: '', language:)
      @text = text
      @language = language
    end
  end
end