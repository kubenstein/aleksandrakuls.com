module Ak
  class Review < Entity
    attr_accessor :text, :author, :link, :language

    def initialize(text:, author:, link: '', language:)
      @text = text
      @author = author
      @link = link
      @language = language
    end
  end
end