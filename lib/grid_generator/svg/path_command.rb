module GridGenerator
  module Svg 
    class PathCommand 
      def initialize(points: []) 
        @points = points
      end

      attr_reader :points

      def type
        'M'
      end

      def +(offset)
        if offset.class == Matrix 
          new_points = points.map { |p| p + offset }
          self.class.new(points: new_points)
        else
          raise ArgumentError, "Offset must be Matrix"
        end
      end

      def ==(other)
        self.class == other.class && self.points == other.points
      end

      def to_s
        [type, points_string].join(' ')
      end

      private

      def points_string
        points.map { |p| "#{p[0,0].round} #{p[1,0].round}" }.join(' ')
      end
    end
  end
end
