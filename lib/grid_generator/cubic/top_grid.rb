require './lib/grid_generator/cubic/grid'

module GridGenerator
  module Cubic
    class TopGrid < Cubic::Grid
      def width_unit
        @width_unit ||= Matrix.column_vector([units, units/2])
      end
  
      def height_unit
        @height_unit ||= Matrix.column_vector([-units, units/2])
      end
  
      def offset_unit
        @offset_unit ||= Matrix.column_vector([units,0])
      end
  
      def line_offset_amount
        height
      end
  
      def square_offset_amount
        height - 1
      end
    end
  end
end 
