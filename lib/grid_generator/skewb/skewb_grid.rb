require_relative '../face_parser'

module GridGenerator
  module Skewb
    class SkewbGrid
      COLOURS = {
        fill: "#d0d0d0",
        stroke: "#404040"
      }

      def initialize(x:, y:, units: , elements: )
        @x, @y = x, y
        @units = units
        @elements = case elements 
        when String
          FaceParser.new(elements).parse
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
  
      def element_shapes
        elements.each_with_index.map do |row, row_num|
          row.each_with_index.map do |col, col_num|
            build_element(row_num, col_num, col)
          end
        end.flatten.compact
      end

      def base_shape_style
        GridGenerator::Svg::Style.new(fill: COLOURS[:fill], stroke: COLOURS[:stroke])
      end

      def base_shape
        GridGenerator::Svg::Polygon.new(points: points, style: base_shape_style)
      end

      def to_svg
        output = base_shape.to_svg

        rows.each { |row| output += row.to_svg }
        columns.each { |col| output += col.to_svg }
        element_shapes.each { |element| output += element.to_svg if element } 

        output
      end
    end
  end
end
