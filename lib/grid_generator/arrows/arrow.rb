module GridGenerator
  module Arrows
    class Arrow
      def initialize(x:, y:, length:, direction: :uni, colour: '#ffffff')
        @x, @y = x, y
        @length = length
        @direction = direction
        @colour = colour
      end
    
      attr_reader :x, :y, :length, :direction, :colour
    
      def points
        []
      end
    
      def points_string
        points.map { |p| p.join(',') }.join(' ')
      end

      def as_json
        {
          "points_string" => points_string,
          "colour" => colour
        }
      end
    end
  end
end
