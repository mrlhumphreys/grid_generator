require 'matrix'
require_relative '../svg/style'
require_relative '../svg/path'
require_relative '../svg/move_command'
require_relative '../svg/line_command'
require_relative '../svg/quadratic_command'
require_relative '../svg/close_command'

module GridGenerator
  module RexCube 
    class ElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @units =  units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :units, :colour, :opacity

      def offset
        @offset ||= Matrix.column_vector([grid_x, grid_y])
      end

      def anchors
        {}
      end

      def commands 
        case [row_num, col_num]
        when [0, 0] # Top Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_top]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_left_corner]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [1, 0] # Top Left Petal 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_top]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_left]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [1, 1] # Top Right Petal 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_top]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [2, 0] # Left Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_left]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_left_corner]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [2, 1] # Center 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center_top]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_bottom]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_left]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [2, 2] # Right Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [3, 0] # Bottom Left Petal 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center_left]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_bottom]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_left]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [3, 1] # Bottom Right Petal 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_bottom]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [4, 0] # Bottom Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center_bottom]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:center_bottom]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        else
          [] 
        end
      end

      def style
        GridGenerator::Svg::Style.new(fill: colour, opacity: opacity)
      end

      def d
        commands.map do |c| 
          (c + offset) 
        end
      end

      def build
        GridGenerator::Svg::Path.new(d: d, style: style)
      end
    end
  end
end
