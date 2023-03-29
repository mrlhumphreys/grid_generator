require_relative '../base_line'
require_relative '../base_element'
require_relative 'skewb_grid'
require_relative 'top_element_factory'

module GridGenerator
  module Skewb
    class TopSkewbGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::TopElementFactory
      end
  
      def points
        [
          Matrix.column_vector([ x + side_size*2*units, y ]),
          Matrix.column_vector([ x + side_size*4*units, y + side_size*units ]),
          Matrix.column_vector([ x + side_size*2*units, y + side_size*2*units ]),
          Matrix.column_vector([ x, y + side_size*units ])
        ]
      end 
  
      def rows
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + 2*units,
            y + (2*i+1)*units,
          ])

          b = Matrix.column_vector([
            x + 6*units,
            y + (2*i+1)*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (4*i+2)*units,
            y + units,
          ])

          b = Matrix.column_vector([
            x + (4*i+2)*units,
            y + 3*units
          ])

          GridGenerator::BaseLine.new(a: a, b: b) 
        end
      end
    end
  end
end
