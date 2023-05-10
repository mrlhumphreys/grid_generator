require_relative '../face_parser'
require_relative './grid'
require_relative './left_element_factory'

module GridGenerator
  module CurvyCopter 
    class LeftGrid < Grid
      def element_factory_class
        LeftElementFactory
      end
    end
  end
end
