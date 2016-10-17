module Ak
  class ReviewsRepository
    def initialize(adapter: YmlAdapter.new)
      @adapter = adapter
    end

    def all(language:)
      raw_data = @adapter.load_data(:reviews, language: language)
      raw_data.map { |data| Review.new(data) }
    end

    def add(review)
      @adapter.add_data(:reviews, data: review.to_h)
    end

    def clear
      @adapter.clear(:reviews)
    end
  end
end