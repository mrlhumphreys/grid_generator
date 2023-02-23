require './lib/grid_generator/skewb/skewb_grid.rb'
require './lib/grid_generator/skewb/top_element_factory.rb'

module GridGenerator
  module Skewb
    class TopSkewbGrid < Skewb::SkewbGrid
      def factory_class
        GridGenerator::Skewb::TopElementFactory
      end
  
      def border_points
        [
          [ x + side_size*2*units, y ],
          [ x + side_size*4*units, y + side_size*units ],
          [ x + side_size*2*units, y + side_size*2*units ],
          [ x, y + side_size*units ]
        ]
      end 
  
      def rows
        Array.new(side_size) do |i|
          { 
            x1: x + 2*units,
            y1: y + (2*i+1)*units,
            x2: x + 6*units,
            y2: y + (2*i+1)*units
          }
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          { 
            x1: x + (4*i+2)*units,
            y1: y + units,
            x2: x + (4*i+2)*units,
            y2: y + 3*units
          }
        end
      end
    end
  end
end
