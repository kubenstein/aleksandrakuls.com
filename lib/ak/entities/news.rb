module Ak
  class News < Entity
    attr_accessor :text, :image, :language

    def initialize(text:, image:, language:)
      @text = text
      @image = image
      @language = language
    end
  end
end