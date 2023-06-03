require_relative '../face_parser'
require_relative './grid'
require_relative './right_element_factory'

module GridGenerator
  module DinoCube 
    class RightGrid < Grid
      def element_factory_class
        RightElementFactory
      end
    end
  end
end
