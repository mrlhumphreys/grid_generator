require 'matrix'
require_relative '../base_element'

module GridGenerator
  module RediCube 
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
        when [0, 0] # top left corner
          [
            anchors[:top_left_corner_top_left],
            anchors[:top_left_corner_top_right],
            anchors[:top_left_corner_bottom_right],
            anchors[:top_left_corner_bottom_left]
          ]
        when [0, 1] # top edge 
          [
            anchors[:top_left_corner_top_right],
            anchors[:top_right_corner_top_left],
            anchors[:top_right_corner_bottom_left],
            anchors[:center],
            anchors[:top_left_corner_bottom_right]
          ]
        when [0, 2] # top right corner 
          [
            anchors[:top_right_corner_top_left],
            anchors[:top_right_corner_top_right],
            anchors[:top_right_corner_bottom_right],
            anchors[:top_right_corner_bottom_left],
          ]
        when [1, 0] # left edge 
          [
            anchors[:top_left_corner_bottom_left],
            anchors[:top_left_corner_bottom_right],
            anchors[:center],
            anchors[:bottom_left_corner_top_right],
            anchors[:bottom_left_corner_top_left]
          ]
        when [1, 1] # right edge 
          [
            anchors[:top_right_corner_bottom_left],
            anchors[:top_right_corner_bottom_right],
            anchors[:bottom_right_corner_top_right],
            anchors[:bottom_left_corner_top_left],
            anchors[:center]
          ]
        when [2, 0] # bottom left corner 
          [
            anchors[:bottom_left_corner_top_left],
            anchors[:bottom_left_corner_top_right],
            anchors[:bottom_left_corner_bottom_right],
            anchors[:bottom_left_corner_bottom_left]
          ]
        when [2, 1] # bottom edge 
          [
            anchors[:center],
            anchors[:bottom_right_corner_bottom_left],
            anchors[:bottom_right_corner_bottom_right],
            anchors[:bottom_left_corner_bottom_right],
            anchors[:bottom_left_corner_bottom_left]
          ]
        when [2, 2] # bottom right corner 
          [
            anchors[:bottom_right_corner_top_left],
            anchors[:bottom_right_corner_top_right],
            anchors[:bottom_right_corner_bottom_left],
            anchors[:bottom_right_corner_bottom_right]
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
