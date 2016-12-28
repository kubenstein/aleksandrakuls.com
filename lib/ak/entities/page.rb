module Ak
  class Page
    include ToHashable

    attr_accessor :text, :language

    def initialize(params)
      @text = params[:text]
      @language = params[:language]
    end
  end
end
