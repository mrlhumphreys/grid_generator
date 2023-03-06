require_relative '../face_parser'

module GridGenerator
  module Megaminx
    class FaceElementFactory
      def initialize(x:, y:, index:, face_points: , face_lines:, face:)
        @x, @y = x, y
        @index = index
        @face_points = face_points
        @face_lines = face_lines
        face_attr = FaceParser.new(face).parse
        @colour = face_attr && face_attr[:colour]
        @opacity = face_attr && face_attr[:opacity]
      end

      attr_reader :x, :y, :index, :face_points, :face_lines, :colour, :opacity 

      def offset
        Matrix.column_vector([x, y])
      end

      # front face points
      # 0 top corner
      # 1 right corner
      # 2 bottom right corner
      # 3 bottom left corner
      # 4 left corner
      
      # front face lines - parallel
      # 0 - top right 
      # 1 - right 
      # 2 - down 
      # 3 - left
      # 4 - top left right
      
      def center_points
        face_lines.each_with_index.map do |line, i|
          a = line
          b = face_lines[(i+1)%5]
          GridGenerator::Helper.intersection(a, b) 
        end
      end
     
      def edge_points(i)
        previous_line = face_lines[(i-1)%5]
        this_line = face_lines[i]
        next_line = face_lines[(i+1)%5]

        previous_this_point = GridGenerator::Helper.intersection(previous_line, this_line)
        this_next_point = GridGenerator::Helper.intersection(this_line, next_line)

        [
          previous_line.b,
          next_line.a,
          this_next_point,
          previous_this_point 
        ]
      end

      def corner_points(i)
        line_a = face_lines[(i-1) % 5]
        line_b = face_lines[(i) % 5]
        intersection = GridGenerator::Helper.intersection(line_a, line_b)

        [
          face_points[i], 
          line_a.b,
          intersection,
          line_b.a
        ]
      end

      def points
        all_points = if index == 0
          center_points
        else
          if index % 2 == 0
            edge_points(index / 2) 
          else
            corner_points((index - 1) / 2)
          end
        end

        all_points.map { |p| p + offset }
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
