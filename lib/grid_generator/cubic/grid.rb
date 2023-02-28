require 'matrix'
require_relative '../face_parser'
require_relative '../base_line'

module GridGenerator
  module Cubic
    class Grid
      def initialize(x:, y:, units: , squares: ) 
        @x, @y = x, y
        @units = units
        @squares = case squares
        when String
          FaceParser.new(squares).to_a
        when Array
          squares
        else
          raise ArgumentError, "squares must be array or string"
        end
      end
  
      attr_reader :x, :y, :units, :squares

      def ==(other)
        self.x == other.x &&
          self.y == other.y &&
          self.units == other.units &&
          self.squares == other.squares
      end
  
      def width
        @width ||= squares.first.size 
      end
  
      def height
        @height ||= squares.size
      end

      # units
      def width_unit
        @width_unit ||= GridGenerator::Cubic::UnitsFactory.new(side: side, type: :width, units: units).build 
      end
  
      def height_unit
        @height_unit ||= GridGenerator::Cubic::UnitsFactory.new(side: side, type: :height, units: units).build 
      end
  
      def offset_unit
        @offset_unit ||= GridGenerator::Cubic::UnitsFactory.new(side: side, type: :offset, units: units).build 
      end
  
      # positioning squares
  
      def top_left_square
        @top_left_square ||= Matrix.column_vector([x, y]) + offset_unit*square_offset_amount
      end
  
      def square_position(row, col)
        top_left_square + width_unit*col + height_unit*row
      end
  
      # positioning lines
  
      def top_left
        @top_left ||= Matrix.column_vector([x,y]) + offset_unit*line_offset_amount
      end
  
      def top_right
        @top_right ||= top_left + width_unit*width
      end
  
      def bottom_right
        @bottom_right ||= top_left + width_unit*width + height_unit*height
      end
  
      def bottom_left
        @bottom_left ||= top_left + height_unit*height
      end
  
      def row_line_start(n)
        top_left + height_unit*n
      end
  
      def row_line_end(n)
        top_right + height_unit*n 
      end
  
      def column_line_start(n)
        top_left + width_unit*n
      end
  
      def column_line_end(n)
        bottom_left + width_unit*n
      end
  
      def rows
        Array.new(height) do |i|
          GridGenerator::BaseLine.new(
            x1: row_line_start(i+1)[0,0],
            y1: row_line_start(i+1)[1,0],
            x2: row_line_end(i+1)[0,0],
            y2: row_line_end(i+1)[1,0]
          )
        end
      end
  
      def columns 
        Array.new(width) do |i|
          GridGenerator::BaseLine.new(
            x1: column_line_start(i+1)[0,0],
            y1: column_line_start(i+1)[1,0],
            x2: column_line_end(i+1)[0,0],
            y2: column_line_end(i+1)[1,0]
          )
        end
      end
  
      def element_shapes
        squares.map.each_with_index do |row, row_num|
          row.map.each_with_index do |col, col_num|
            if col
              GridGenerator::Cubic::SquareFactory.new(
                x: square_position(row_num, col_num)[0,0], 
                y: square_position(row_num, col_num)[1,0], 
                width_unit: width_unit,
                height_unit: height_unit,
                offset_unit: offset_unit,
                colour: col[:colour], 
                opacity: col[:opacity]
              ).build
            end
          end
        end.flatten.compact
      end
  
      def points
        [
          top_left,
          top_right,
          bottom_right,
          bottom_left
        ]
      end
  
      def points_string
        points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      def as_json
        {
          "points_string" => points_string,
          "rows" => rows,
          "columns" => columns,
          "element_shapes" => element_shapes.map(&:as_json)
        }
      end
    end
  end
end

