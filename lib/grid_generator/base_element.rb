module GridGenerator
  class BaseElement
    def initialize(points:, colour: , opacity: 1)
      @points = points
      @colour = colour
      @opacity = opacity
    end

    attr_reader :points, :colour, :opacity

    def ==(other)
      self.class == other.class &&
        self.points == other.points &&
        self.colour == other.colour &&
        self.opacity == other.opacity
    end

    def points_string
      points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
    end

    def as_json
      {
        "points_string" => points_string,
        "colour" => colour,
        "opacity" => opacity
      }
    end
  end
end
