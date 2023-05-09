module GridGenerator
  module Svg 
    class Polygon
      def initialize(points: , style:)
        @points = case points
                  when Array
                    points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
                  when String
                    points
                  else
                    raise ArgumentError, "points must be Array or String" 
                  end
        @style = case style
                 when GridGenerator::Svg::Style
                   style.to_s
                 when String
                   style
                 else
                   raise ArgumentError, "style must be String or Style" 
                 end
      end

      attr_reader :points, :style

      def to_svg
        "<polygon points=\"#{points}\" style=\"#{style.to_s}\" />"
      end
    end
  end
end
