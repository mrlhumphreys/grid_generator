require './lib/grid_generator/skewb/skewb_grid.rb'
require './lib/grid_generator/skewb/right_element_factory.rb'

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
          { 
            x1: x + (2*i)*units,
            y1: y + (i+4)*units,
            x2: x + (2*i+2)*units,
            y2: y + (i+1)*units
          }
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          { 
            x1: x + (2*i)*units,
            y1: y + (-3*i+4)*units,
            x2: x + (i+1)*2*units,
            y2: y + (-3*i+5)*units
          }
        end
      end
    end
  end
end
