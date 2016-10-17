module Ak
  class Page < OpenStruct
    def text
      super.to_s
    end
  end
end