module Ak
  class Review
    include ToHashable

    attr_accessor :text, :author, :link, :language

    def initialize(text:, author:, link: '', language:)
      @text = text
      @author = author
      @link = link
      @language = language
    end
  end
end
