require_relative 'grid'
require_relative 'units_factory'

module GridGenerator
  module Cubic
    class FrontGrid < GridGenerator::Cubic::Grid
      def side
        :front
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
