module Ak
  class Music < Entity
    attr_accessor :title, :yt_id, :language

    def initialize(title:, yt_id:, language:)
      @title = title
      @yt_id = yt_id
      @language = language
    end
  end
end