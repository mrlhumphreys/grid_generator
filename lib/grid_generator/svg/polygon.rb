module GridGenerator
  module Svg 
    class Polygon
      def initialize(points: , style:)
        @points = case points
                  when Array
                    points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
                  else
                    points
                  end
        @style = style
      end

      attr_reader :points, :style

      def to_svg
        "<polygon points=\"#{points}\" style=\"#{style.to_s}\" />"
      end
    end
  end
end
