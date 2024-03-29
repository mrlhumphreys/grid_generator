require_relative '../base_line'
require_relative '../base_element'
require_relative 'skewb_grid.rb'
require_relative 'right_element_factory.rb'

module GridGenerator
  module Skewb
    class RightGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::RightElementFactory
      end
  
      def points
        [
          Matrix.column_vector([ x, y + side_size*units ]),
          Matrix.column_vector([ x + side_size*2*units, y ]),
          Matrix.column_vector([ x + side_size*2*units, y + side_size*2*units ]),
          Matrix.column_vector([ x, y + side_size*3*units ])
        ]
      end 
  
      def rows
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (2*i)*units,
            y + (i+4)*units,
          ])

          b = Matrix.column_vector([
            x + (2*i+2)*units,
            y + (i+1)*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (2*i)*units,
            y + (-3*i+4)*units,
          ])

          b = Matrix.column_vector([
            x + (i+1)*2*units,
            y + (-3*i+5)*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
    end
  end
end
