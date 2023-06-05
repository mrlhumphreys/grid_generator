require_relative '../face_parser'
require_relative './grid'
require_relative './top_element_factory'

module GridGenerator
  module RediCube 
    class TopGrid < Grid
      def element_factory_class
        TopElementFactory
      end
    end
  end
end
