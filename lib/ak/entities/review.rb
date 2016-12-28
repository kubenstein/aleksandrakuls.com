module Ak
  class Review
    include ToHashable

    attr_accessor :text, :author, :link, :language

    def initialize(params)
      @text = params[:text]
      @author = params[:author]
      @link = params[:link] || ''
      @language = params[:language]
    end
  end
end
