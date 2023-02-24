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
          { 
            x1: x + (2*i)*units,
            y1: y + (3*i+2)*units,
            x2: x + (2*i+2)*units,
            y2: y + (3*i+1)*units
          }
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          { 
            x1: x + (2*i)*units,
            y1: y + (-1*i+2)*units,
            x2: x + (i+1)*2*units,
            y2: y + (-1*i+5)*units
          }
        end
      end
    end
  end
end
