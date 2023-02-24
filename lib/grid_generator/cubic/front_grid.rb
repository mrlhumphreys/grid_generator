require_relative 'grid'

module GridGenerator
  module Cubic
    class FrontGrid < GridGenerator::Cubic::Grid
      def width_unit
        @width_unit ||= Matrix.column_vector([units, units/2])
      end
  
      def height_unit
        @height_unit ||= Matrix.column_vector([0, units])
      end
  
      def offset_unit
        @offset_unit ||= Matrix.column_vector([0,0])
      end
  
      def line_offset_amount
        0 
      end
  
      def square_offset_amount
        0 
      end
    end
  end
end
