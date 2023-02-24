require_relative '../face_parser'

module GridGenerator
  module Skewb
    class SkewbGrid
      def initialize(x:, y:, units: , elements: )
        @x, @y = x, y
        @units = units
        @elements = case elements 
        when String
          FaceParser.new(elements).to_a
        when Array
          elements 
        else
          raise ArgumentError, "squares must be array or string"
        end
      end
  
      attr_reader :x, :y, :units, :elements
  
      def side_size 
        elements.size - 1
      end
  
      def build_element(row_num, col_num, data)
        if data
          factory_class.new(
            grid_x: x,
            grid_y: y,
            row_num: row_num,
            col_num: col_num,
            side_size: side_size,
            units: units,
            colour: data[:colour],
            opacity: data[:opacity]
          ).build
        else
          nil
        end
      end
  
      def border_points_string
        border_points.map { |x| x.join(',') }.join(' ') 
      end
  
      def element_shapes
        elements.each_with_index.map do |row, row_num|
          row.each_with_index.map do |col, col_num|
            build_element(row_num, col_num, col)
          end
        end.flatten.compact
      end

      def as_json
        {
          "border_points_string" => border_points_string,
          "element_shapes" => element_shapes.map(&:as_json)
        }
      end
    end
  end
end
