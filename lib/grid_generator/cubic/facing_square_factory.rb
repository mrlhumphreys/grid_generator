require './lib/grid_generator/base_element'

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
          [ x, y ],
          [ max_x, y ],
          [ max_x, max_y ],
          [ x, max_y ]
        ]
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end


