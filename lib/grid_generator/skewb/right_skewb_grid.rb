require_relative '../line'
require_relative '../base_element'
require_relative 'skewb_grid.rb'
require_relative 'right_element_factory.rb'

module GridGenerator
  module Skewb
    class RightSkewbGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::RightElementFactory
      end
  
      def border_points
        [
          [ x, y + side_size*units ],
          [ x + side_size*2*units, y ],
          [ x + side_size*2*units, y + side_size*2*units ],
          [ x, y + side_size*3*units ]
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

          GridGenerator::Line.new(a: a, b: b) 
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

          GridGenerator::Line.new(a: a, b: b) 
        end
      end
    end
  end
end
