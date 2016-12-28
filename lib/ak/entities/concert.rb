module Ak
  class Concert
    include ToHashable

    attr_accessor :text, :date, :language

    def initialize(params)
      @text = params[:text]
      @date = params[:date].to_date
      @language = params[:language]
    end
  end
end
