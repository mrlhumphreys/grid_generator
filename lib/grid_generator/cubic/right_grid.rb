require_relative 'grid'

module GridGenerator
  module Cubic
    class RightGrid < Cubic::Grid
      def side
        :right
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
