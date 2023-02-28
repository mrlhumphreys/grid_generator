require_relative '../base_element'
require_relative 'units_factory'

module GridGenerator
  module Cubic
    class SquareFactory
      def initialize(x:, y:, width_unit:, height_unit:, offset_unit:, colour:, opacity:)
        @x, @y = x, y
        @width_unit = width_unit
        @height_unit = height_unit
        @offset_unit = offset_unit
        @colour, @opacity = colour, opacity 
      end
  
      attr_reader :x, :y, :width_unit, :height_unit, :offset_unit, :colour, :opacity

      def top_left
        Matrix.column_vector([x, y]) + offset_unit
      end
  
      def top_right
        top_left + width_unit
      end 
  
      def bottom_right
        top_left + width_unit + height_unit
      end 
  
      def bottom_left
        top_left + height_unit
      end

      def points
        [
          top_left,
          top_right,
          bottom_right,
          bottom_left,
        ]
      end
  
      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
