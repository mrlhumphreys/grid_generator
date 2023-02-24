require_relative 'grid'

module GridGenerator
  module Cubic
    class RightGrid < Cubic::Grid
      def width_unit
        @width_unit ||= Matrix.column_vector([units, (units*-0.5).to_i])
      end
  
      def height_unit
        @height_unit ||= Matrix.column_vector([0, units])
      end
  
      def offset_unit
        @offset_unit ||= Matrix.column_vector([0,(units*0.5).to_i])
      end
  
      def line_offset_amount
        width
      end
  
      def square_offset_amount
        width - 1 
      end
    end
  end
end
