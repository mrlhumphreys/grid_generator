module GridGenerator
  class BaseElement
    COLOURS = {
      fill: "#d0d0d0",
      stroke: "#404040"
    }

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

    def to_svg
      "<polygon points=\"#{points_string}\" style=\"fill:#{colour};stroke:#{COLOURS[:stroke]};stroke-width:1;opacity:#{opacity}\" />"
    end
  end
end
