require_relative 'grid'
require_relative 'units_factory'

module GridGenerator
  module Cubic
    class TopGrid < Cubic::Grid
      def side
        :top
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
