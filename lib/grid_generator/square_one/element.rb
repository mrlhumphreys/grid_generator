require 'matrix'

module GridGenerator
  module SquareOne
    class Element 
      def initialize(x:, y:, units:, offset: , colour: , opacity: )
        @x, @y = x, y
        @units = units
        @offset = offset
        @colour = colour
        @opacity = opacity
      end
  
      attr_reader :x, :y, :units, :offset, :colour, :opacity
      
      def ==(other)
        self.x == other.x &&
          self.y == other.y &&
          self.units == other.units &&
          self.colour == other.colour &&
          self.opacity == other.opacity
      end
  
      def offset_radians
        offset*Math::PI/6
      end
  
      def half_edge_width 
        @half_edge_width ||= half_face_size * Math.tan(Math::PI/12) 
      end
  
      def half_face_size 
        @half_face_size ||= face_size / 2 
      end
  
      def face_size
        @face_size ||= 3 * units
      end
  
      def rotation_point
        Matrix.column_vector([x+half_face_size, y+half_face_size])
      end
  
      def rotation_matrix
        @rotation_matrix ||= Matrix[
          [Math.cos(offset_radians), -1*Math.sin(offset_radians)], 
          [Math.sin(offset_radians), Math.cos(offset_radians)]
        ]
      end
  
      def points
        base_points.map { |p| (rotation_matrix * (p - rotation_point)) + rotation_point }
      end
  
      def points_string
        points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end
    end
  end
end
