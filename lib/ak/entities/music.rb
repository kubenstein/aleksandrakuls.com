module Ak
  class Music
    include ToHashable

    attr_accessor :title, :yt_id, :language

    def initialize(params)
      @title = params[:title]
      @yt_id = params[:yt_id]
      @language = params[:language]
    end
  end
end
