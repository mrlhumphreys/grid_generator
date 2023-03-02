require_relative '../face_parser'
require_relative '../base_element'

module GridGenerator
  module Pyraminx
    class TriangleFactory
      def initialize(x:, y:, row:, col:, units:, size:, face:)
        @x, @y = x, y
        @row = row
        @col = col
        @units = units
        @size = size
        face_attr = GridGenerator::FaceParser.new(face).parse
        @colour = face_attr && face_attr[:colour]
        @opacity = face_attr && face_attr[:opacity]
      end

      attr_reader :x, :y, :row, :col, :units, :size, :colour, :opacity

      #  x + ((3 - 0) * 0.5 * units) + 0 * 0.5 * units # row = 0, col = 0
      #  x + ((3 - 1) * 0.5 * units) + 0 * 0.5 * units # row = 1, col = 0
      #  x + ((3 - 1) * 0.5 * units) + 2 * 0.5 * units # row = 1, col = 2 
      #  x + ((3 - 2) * 0.5 * units) + 0 * 0.5 * units # row = 2, col = 0
      #  x + ((3 - 2) * 0.5 * units) + 2 * 0.5 * units # row = 2, col = 2 
      #  x + ((3 - 2) * 0.5 * units) + 4 * 0.5 * units # row = 2, col = 4 
      def even_top_x
        x + ((size - row) * 0.5 * units) + col * 0.5 * units 
      end

      # x + (0 * -1 + (3 - 1)) * 0.5 * units + 0 * 0.5 * units # row = 0, col = 0 
      # x + (1 * -1 + (3 - 1)) * 0.5 * units + 0 * 0.5 * units # row = 1, col = 0 
      # x + (1 * -1 + (3 - 1)) * 0.5 * units + 2 * 0.5 * units # row = 1, col = 2 
      # x + (2 * -1 + (3 - 1)) * 0.5 * units + 0 * 0.5 * units # row = 2, col = 0 
      # x + (2 * -1 + (3 - 1)) * 0.5 * units + 2 * 0.5 * units # row = 2, col = 2 
      # x + (2 * -1 + (3 - 1)) * 0.5 * units + 4 * 0.5 * units# row = 2, col = 4 
      def even_bottom_left_x
        x + (row * -1 + (size - 1)) * 0.5 * units + col * 0.5 * units 
      end

      #  x + (0 * -1 + (3 + 1)) * 0.5 * units + 0 * 0.5 * units # row = 0, col = 0
      #  x + (1 * -1 + (3 + 1)) * 0.5 * units + 0 * 0.5 * units # row = 1, col = 0
      #  x + (1 * -1 + (3 + 1)) * 0.5 * units + 2 * 0.5 * units # row = 1, col = 2 
      #  x + (2 * -1 + (3 + 1)) * 0.5 * units + 0 * 0.5 * units # row = 2, col = 0
      #  x + (2 * -1 + (3 + 1)) * 0.5 * units + 2 * 0.5 * units # row = 2, col = 2 
      #  x + (2 * -1 + (3 + 1)) * 0.5 * units + 4 * 0.5 * units # row = 2, col = 4 
      def even_bottom_right_x
        x + (row * -1 + (size + 1)) * 0.5 * units + col * 0.5 * units
      end

      #  0 * Math.sqrt(3)/2 * units # row = 0
      #  1 * Math.sqrt(3)/2 * units # row = 1
      #  2 * Math.sqrt(3)/2 * units # row = 2
      def top_y
        y + row * Math.sqrt(3)/2 * units
      end

      #  (0 + 1) * Math.sqrt(3)/2 * units # row = 0
      #  (1 + 1) * Math.sqrt(3)/2 * units # row = 1
      #  (2 + 1) * Math.sqrt(3)/2 * units # row = 2
      def bottom_y
        y + (row + 1) * Math.sqrt(3)/2 * units
      end

      #  (0 * -1 + 3) * 0.5 * units # row 0
      #  (1 * -1 + 3) * 0.5 * units + (1 - 1) * 0.5 * units # row 1, col = 1 
      #  (1 * -1 + 3) * 0.5 * units + (3 - 1) * 0.5 * units # row 1, col = 3 
      #  (2 * -1 + 3) * 0.5 * units + (1 - 1) * 0.5 * units # row 2, col = 1
      #  (2 * -1 + 3) * 0.5 * units + (3 - 1) * 0.5 * units # row 2, col = 3 
      def odd_top_left_x
        x + (row * -1 + size) * 0.5 * units + (col - 1) * 0.5 * units
      end

      # ((0 * -1) + 3 + 2) * 0.5 * units + (1 - 1) * 0.5 * units # row 0, col = 1
      # ((1 * -1) + 3 + 2) * 0.5 * units + (1 - 1) * 0.5 * units # row 1, col = 1
      # ((2 * -1) + 3 + 2) * 0.5 * units + (1 - 1) * 0.5 * units # row 2, col = 1
      # ((2 * -1) + 3 + 2) * 0.5 * units + (3 - 1) * 0.5 * units # row 2, col = 3 
      def odd_top_right_x
        x + (row * -1 + size + 2) * 0.5 * units + (col - 1) * 0.5 * units 
      end

      #  (0 * -1 + 3 + 1) * 0.5 * units + (1 - 1) * 0.5 * units # row 0, col = 1
      #  (1 * -1 + 3 + 1) * 0.5 * units + (1 - 1) * 0.5 * units # row 1, col = 1
      #  (2 * -1 + 3 + 1) * 0.5 * units + (1 - 1) * 0.5 * units # row 2, col = 1
      #  (2 * -1 + 3 + 1) * 0.5 * units + (3 - 1) * 0.5 * units # row 2, col = 3
      def odd_bottom_x
        x + (row * -1 + size + 1) * 0.5 * units + (col - 1) * 0.5 * units
      end

      def even_points
        [
          Matrix.column_vector([even_top_x, top_y]),
          Matrix.column_vector([even_bottom_right_x, bottom_y]),
          Matrix.column_vector([even_bottom_left_x, bottom_y])
        ]
      end

      def odd_points
        [
          Matrix.column_vector([odd_top_left_x, top_y]),
          Matrix.column_vector([odd_top_right_x, top_y]),
          Matrix.column_vector([odd_bottom_x, bottom_y])
        ]
      end

      def points
        if col % 2 == 0
          even_points
        else
          odd_points
        end
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity) unless colour.nil?
      end
    end
  end
end
