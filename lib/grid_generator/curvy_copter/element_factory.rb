require 'matrix'
require_relative '../svg/style'
require_relative '../svg/path'
require_relative '../svg/move_command'
require_relative '../svg/line_command'
require_relative '../svg/quadratic_command'
require_relative '../svg/close_command'

module GridGenerator
  module CurvyCopter 
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
        when [0, 0] # Top Left Corner 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_left_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_edge_left]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_left_corner_center], anchors[:left_edge_top]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [0, 1] # Top Middle Edge
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_edge_left]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_edge_right]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_edge_center], anchors[:top_edge_left]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [0, 2] # Top Right Corner
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_edge_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:top_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:right_edge_top]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_right_corner_center], anchors[:top_edge_right]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [1, 0] # Top Left Middle
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_edge_left]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:left_edge_center], anchors[:left_edge_top]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_left_corner_center], anchors[:top_edge_left]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [1, 1] # Top Right Middle
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:top_edge_right]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_right_corner_center], anchors[:right_edge_top]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:right_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:top_edge_center], anchors[:top_edge_right]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [2, 0] # Middle Left Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:left_edge_top]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:left_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:left_edge_center], anchors[:left_edge_bottom]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [2, 1] # Middle Right Edge
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:right_edge_top]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:right_edge_bottom]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:right_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:right_edge_center], anchors[:right_edge_top]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [3, 0] # Bottom Left Middle 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:left_edge_bottom]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:left_edge_center], anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_edge_center], anchors[:bottom_edge_left]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_left_corner_center], anchors[:left_edge_bottom]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [3, 1] # Bottom Right Middle
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:right_edge_center], anchors[:right_edge_bottom]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_right_corner_center], anchors[:bottom_edge_right]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_edge_center], anchors[:center]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [4, 0] # Bottom Left Corner 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:left_edge_bottom]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_left_corner_center], anchors[:bottom_edge_left]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_left_corner]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [4, 1] # Bottom Middle Edge 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:center]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_edge_center], anchors[:bottom_edge_right]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_edge_left]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_edge_center], anchors[:center]]),
            GridGenerator::Svg::CloseCommand.new
          ]
        when [4, 2] # Bottom Right Corner 
          [
            GridGenerator::Svg::MoveCommand.new(points: [anchors[:right_edge_bottom]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_right_corner]]),
            GridGenerator::Svg::LineCommand.new(points: [anchors[:bottom_edge_right]]),
            GridGenerator::Svg::QuadraticCommand.new(points: [anchors[:bottom_right_corner_center], anchors[:right_edge_bottom]]),
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
