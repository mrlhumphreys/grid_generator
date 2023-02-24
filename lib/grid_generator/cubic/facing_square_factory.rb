require_relative '../base_element'

module GridGenerator
  module Cubic
    class FacingSquareFactory
      def initialize(x: , y:, width:, height:, colour:, opacity:)
        @x, @y = x, y
        @width, @height = width, height
        @colour, @opacity = colour, opacity
      end

      attr_reader :x, :y, :width, :height, :colour, :opacity

      def max_x
        x + width 
      end
  
      def max_y
        y + height 
      end

      def points
        [
          Matrix.column_vector([ x, y ]),
          Matrix.column_vector([ max_x, y ]),
          Matrix.column_vector([ max_x, max_y ]),
          Matrix.column_vector([ x, max_y ])
        ]
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end


