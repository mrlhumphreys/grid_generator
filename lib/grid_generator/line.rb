module GridGenerator
  class Line
    def initialize(a:, b:)
      @a, @b = a, b
    end

    attr_reader :a, :b

    def ==(other)
      self.class == other.class &&
        self.a == other.a &&
        self.b == other.b
    end

    def x1
      a[0,0]
    end

    def y1
      a[1,0]
    end

    def x2
      b[0,0]
    end

    def y2
      b[1,0]
    end
  end
end

