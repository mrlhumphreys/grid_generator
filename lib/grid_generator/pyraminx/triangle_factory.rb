require './lib/grid_generator/base_element'

module GridGenerator
  module Pyraminx
    class TriangleFactory
      def initialize(x:, y:, units:, direction:, colour:, opacity:)
        @x, @y = x, y
        @units = units
        @direction = direction
        @colour = colour
        @opacity = opacity
      end

      attr_reader :x, :y, :units, :direction, :colour, :opacity

      def up_points
        [
          Matrix.column_vector([ x+units, y ]),
          Matrix.column_vector([ x+2*units, y+units ]),
          Matrix.column_vector([ x, y+units ])
        ]
      end

      def down_points
        [
          Matrix.column_vector([ x+units, y+units ]),
          Matrix.column_vector([ x+2*units, y ]),
          Matrix.column_vector([ x, y ])
        ]
      end

      def points
        if direction == :up
          up_points
        else
          down_points
        end
      end
      
      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
