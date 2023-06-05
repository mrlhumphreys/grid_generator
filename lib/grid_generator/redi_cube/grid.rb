require_relative '../face_parser'

module GridGenerator
  module RediCube 
    class Grid
      def initialize(x:, y:, units: , elements: )
        @x, @y = x, y
        @units = units
        @elements = case elements
                    when String
                      FaceParser.new(elements).parse
                    when Array
                      elements
                    else
                      raise ArgumentError, "elements must be array or string"
                    end
      end

      attr_reader :x, :y, :units, :elements

      def to_svg
        output = ''

        element_shapes.each { |element| output += element.to_svg if element }

        output
      end

      private

      def build_element(row_num, col_num, data)
        if data
          element_factory_class.new(
            grid_x: x,
            grid_y: y,
            row_num: row_num,
            col_num: col_num,
            units: units,
            colour: data[:colour],
            opacity: data[:opacity]
          ).build
        else
          nil
        end
      end

      def element_shapes
        elements.each_with_index.map do |row, row_num|
          row.each_with_index.map do |col, col_num|
            build_element(row_num, col_num, col)
          end
        end.flatten.compact
      end
    end
  end
end
