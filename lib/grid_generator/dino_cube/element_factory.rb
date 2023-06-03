require 'matrix'
require_relative '../base_element'

module GridGenerator
  module DinoCube 
    class ElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @units = units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :units, :colour, :opacity

      def offset
        @offset ||= Matrix.column_vector([grid_x, grid_y])
      end

      def points
        _points = case [row_num, col_num]
        when [0, 0] # top
          [
            anchors[:top_left_corner],
            anchors[:top_right_corner],
            anchors[:center]
          ]
        when [1, 0] # left 
          [
            anchors[:top_left_corner],
            anchors[:center],
            anchors[:bottom_left_corner]
          ]
        when [0, 1] # right 
          [
            anchors[:top_right_corner],
            anchors[:bottom_right_corner],
            anchors[:center]
          ]
        when [1, 0] # bottom 
          [
            anchors[:center],
            anchors[:bottom_right_corner],
            anchors[:bottom_left_corner]
          ]
        else
          []
        end
        _points.map { |p| p + offset }
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
