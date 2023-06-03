require_relative '../base_line'
require_relative 'skewb_grid'
require_relative 'left_element_factory'

module GridGenerator
  module Skewb
    class LeftGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::LeftElementFactory
      end
  
      def points
        [
          Matrix.column_vector([ x, y ]),
          Matrix.column_vector([ x + side_size*2*units, y + side_size*units ]),
          Matrix.column_vector([ x + side_size*2*units, y + side_size*3*units ]),
          Matrix.column_vector([ x, y + side_size*2*units ])
        ]
      end 
  
      def rows
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (2*i)*units,
            y + (3*i+2)*units,
          ])

          b = Matrix.column_vector([
            x + (2*i+2)*units,
            y + (3*i+1)*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (2*i)*units,
            y + (-1*i+2)*units,
          ])

          b = Matrix.column_vector([
            x + (i+1)*2*units,
            y + (-1*i+5)*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
    end
  end
end
