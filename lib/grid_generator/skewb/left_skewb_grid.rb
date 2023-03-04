require_relative '../line'
require_relative 'skewb_grid'
require_relative 'left_element_factory'

module GridGenerator
  module Skewb
    class LeftSkewbGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::LeftElementFactory
      end
  
      def border_points
        [
          [ x, y ],
          [ x + side_size*2*units, y + side_size*units ],
          [ x + side_size*2*units, y + side_size*3*units ],
          [ x, y + side_size*2*units ]
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

          GridGenerator::Line.new(a: a, b: b) 
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

          GridGenerator::Line.new(a: a, b: b) 
        end
      end
    end
  end
end
