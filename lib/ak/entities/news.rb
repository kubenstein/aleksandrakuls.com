module Ak
  class News
    include ToHashable

    attr_accessor :text, :image, :language

    def initialize(params)
      @text = params[:text]
      @image = params[:image]
      @language = params[:language]
    end
  end
end
