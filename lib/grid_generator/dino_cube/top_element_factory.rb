require_relative './element_factory'

module GridGenerator
  module DinoCube 
    class TopElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner: Matrix.column_vector([units, 0]),
          top_right_corner: Matrix.column_vector([2*units, 0.5*units]),
          bottom_left_corner: Matrix.column_vector([0, 0.5*units]),
          bottom_right_corner: Matrix.column_vector([units, units]),
          center: Matrix.column_vector([units, 0.5*units])
        }
      end
    end
  end
end
