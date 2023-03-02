require_relative 'triangle_factory'

module GridGenerator
  module Pyraminx
    # * 
    # * * *
    # * * * * * 
    class Face
      def initialize(x:, y:, units:, elements:) 
        @x, @y = x, y
        @units = units
        @elements = elements.split('\n').map { |r| r.split(',') }
      end

      attr_reader :x, :y, :units, :elements

      def size
        elements.size
      end

      def start_x_for_row(r)
        (size - 1 - r) * units / 2
      end

      def end_x_for_row(r)
        (size + 1 + r) * units / 2
      end

      def y_for_row(r)
        Math.sqrt(3)/2 * (r + 1) * units
      end

      def vertical_lines 
        Array.new(size-1) do |i|
          GridGenerator::BaseLine.new( 
            x1: x + start_x_for_row(i),
            y1: y + y_for_row(i),
            x2: x + end_x_for_row(i),
            y2: y + y_for_row(i) 
          )
        end
      end

      def diagonal_down_lines 
        Array.new(size-1) do |i|
          GridGenerator::BaseLine.new( 
            x1: x + start_x_for_row(i),
            y1: y + y_for_row(i),
            x2: x + (size - 1 - i)*units,
            y2: y + y_for_row(size-1) 
          )
        end
      end

      def diagonal_up_lines 
        Array.new(size-1) do |i|
          GridGenerator::BaseLine.new( 
            x1: x + (i+1)*units,
            y1: y + y_for_row(size-1),
            x2: x + end_x_for_row(i),
            y2: y + y_for_row(i) 
          )
        end
      end

      def top
        Matrix.column_vector([
          x + size * units / 2,
          y 
        ])
      end

      def bottom_left
        Matrix.column_vector([
          x,
          y + size * Math.sqrt(3)/2 * units
        ])
      end

      def bottom_right
        Matrix.column_vector([
          x + size * units,
          y + size * Math.sqrt(3)/2 * units
        ])
      end

      def points
        [ top, bottom_left, bottom_right ]
      end

      def points_string
        points.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      def element_shapes
        elements.map.each_with_index do |row, row_num|
          row.map.each_with_index do |col, col_num|
            GridGenerator::Pyraminx::TriangleFactory.new(
              x: x,
              y: y,
              row: row_num,
              col: col_num,
              units: units,
              size: size,
              face: col
            ).build unless col == '-' 
          end
        end.flatten.compact
      end
    end
  end
end
