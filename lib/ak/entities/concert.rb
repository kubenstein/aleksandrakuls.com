module Ak
  class Concert < Entity
    # date format: YYYY-MM-DD
    attr_accessor :text, :date, :language

    def initialize(text:, date:, language:)
      @text = text
      @date = date
      @language = language
    end
  end
end