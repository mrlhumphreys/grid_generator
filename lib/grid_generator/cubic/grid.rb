require 'matrix'
require_relative '../line'

module GridGenerator
  module Cubic
    class Grid
      COLOURS = {
        fill: "#d0d0d0",
        stroke: "#404040"
      }

      def initialize(x:, y:, units: , squares: ) 
        @x, @y = x, y
        @units = units
        @squares = case squares
        when String
          squares.split('\n').map { |r| r.split(',') }
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
          a = Matrix.column_vector([
            row_line_start(i+1)[0,0],
            row_line_start(i+1)[1,0],
          ])

          b = Matrix.column_vector([
            row_line_end(i+1)[0,0],
            row_line_end(i+1)[1,0]
          ])

          GridGenerator::Line.new(a: a, b: b)
        end
      end
  
      def columns 
        Array.new(width) do |i|
          a = Matrix.column_vector([
            column_line_start(i+1)[0,0],
            column_line_start(i+1)[1,0],
          ])

          b = Matrix.column_vector([
            column_line_end(i+1)[0,0],
            column_line_end(i+1)[1,0]
          ])

          GridGenerator::Line.new(a: a, b: b)
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
                face: col
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

      def to_svg
        output = "<polygon points=\"#{points_string}\" style=\"fill:#{COLOURS[:fill]};stroke:#{COLOURS[:stroke]};stroke-width:1\" />"

        for row in rows do
          output += "<line x1=\"#{row.x1}\" y1=\"#{row.y1}\" x2=\"#{row.x2}\" y2=\"#{row.y2}\" style=\"stroke:#{COLOURS[:stroke]};stroke-width:1\" />"
        end

        for col in columns do
          output += "<line x1=\"#{col.x1}\" y1=\"#{col.y1}\" x2=\"#{col.x2}\" y2=\"#{col.y2}\" style=\"stroke:#{COLOURS[:stroke]};stroke-width:1\" />"
        end

        for shape in element_shapes do
          output += "<polygon points=\"#{shape.points_string}\" style=\"fill:#{shape.colour};stroke:#{COLOURS[:stroke]};stroke-width:1;opacity:#{shape.opacity}\" />"
        end

        output
      end
    end
  end
end

