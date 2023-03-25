require 'matrix'
require_relative '../face_parser'
require_relative '../line'
require_relative 'facing_square_factory'

module GridGenerator
  module Cubic
    class FacingGrid
      COLOURS = {
        fill: "#d0d0d0",
        stroke: "#404040"
      }

      def initialize(x:, y:, units:, squares: )
        @x, @y = x, y
        @units = units
        @squares = case squares
        when String
          FaceParser.new(squares).parse
        when Array
          squares
        else
          raise ArgumentError, "squares must be array or string" 
        end
      end
  
      attr_reader :x, :y, :units, :squares
  
      def width
        squares.first.size 
      end
  
      def height
        squares.size
      end
  
      def max_x 
        x + width * units
      end 
  
      def max_y
        y + height * units
      end
  
      def unit_x(n)
        x + n * units
      end
  
      def unit_y(n)
        y + n * units
      end

      def unit_width(_)
        units
      end

      def unit_height(_)
        units
      end
  
      def rows
        Array.new(height) do |i|
          a = Matrix.column_vector([
            x,
            unit_y(i+1),
          ])

          b = Matrix.column_vector([
            max_x,
            unit_y(i+1)
          ])

          GridGenerator::Line.new(a: a, b: b) 
        end
      end
  
      def columns 
        Array.new(width) do |i|
          a = Matrix.column_vector([
            unit_x(i+1),
            y,
          ])

          b = Matrix.column_vector([
            unit_x(i+1),
            max_y
          ])

          GridGenerator::Line.new(a: a, b: b)
        end
      end
  
      def element_shapes
        squares.map.each_with_index do |row, row_num|
          row.map.each_with_index do |col, col_num|
            if col 
              Cubic::FacingSquareFactory.new(x: unit_x(col_num), y: unit_y(row_num), width: unit_width(col_num), height: unit_height(row_num), colour: col[:colour], opacity: col[:opacity]).build
            end
          end
        end.flatten.compact
      end
  
      def points
        [
          Matrix.column_vector([ x, y ]),
          Matrix.column_vector([ max_x, y ]),
          Matrix.column_vector([ max_x, max_y ]),
          Matrix.column_vector([ x, max_y ])
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
