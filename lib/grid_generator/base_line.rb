module GridGenerator
  class BaseLine
    def initialize(x1:, y1:, x2:, y2:)
      @x1, @y1 = x1, y1
      @x2, @y2 = x2, y2
    end

    attr_reader :x1, :y1, :x2, :y2

    def ==(other)
      self.x1 == other.x1 &&
        self.y1 == other.y1 &&
        self.x2 == other.x2 &&
        self.y2 == other.y2
    end

    def as_json
      {
        "x1" => x1,
        "y1" => y1,
        "x2" => x2,
        "y2" => y2
      }
    end
  end
end
