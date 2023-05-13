require 'matrix'
require_relative '../base_element'

module GridGenerator
  module Skewb
    class ElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, side_size:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @side_size, @units = side_size, units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :side_size, :units, :colour, :opacity

      def offset
        @offset ||= Matrix.column_vector([grid_x, grid_y])
      end

      def points
        _points = case [row_num, col_num]
        when [0, 0] # top left corner
          [
            anchors[:top_left_corner],
            anchors[:top_middle],
            anchors[:left_middle]
          ]
        when [0, 2] # top right corner
          [
            anchors[:top_middle],
            anchors[:top_right_corner],
            anchors[:right_middle]
          ]
        when [1, 1] # center
          [
            anchors[:top_middle],
            anchors[:right_middle],
            anchors[:bottom_middle],
            anchors[:left_middle]
          ]
        when [2, 0] # bottom left corner
          [
            anchors[:left_middle],
            anchors[:bottom_middle],
            anchors[:bottom_left_corner]
          ]
        when [2, 2] # bottom right corner
          [
            anchors[:right_middle],
            anchors[:bottom_right_corner],
            anchors[:bottom_middle]
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
