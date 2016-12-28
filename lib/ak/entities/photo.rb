module Ak
  class Photo
    include ToHashable

    attr_accessor :title, :file_name, :language

    def initialize(params)
      @title = params[:title]
      @file_name = params[:file_name]
      @language = params[:language]
    end
  end
end
