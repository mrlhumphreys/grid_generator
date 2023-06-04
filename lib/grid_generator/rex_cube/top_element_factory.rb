require_relative './element_factory'

module GridGenerator
  module RexCube 
    class TopElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner: Matrix.column_vector([3*units, 0*units]),
          top_right_corner: Matrix.column_vector([6*units, 1.5*units]),
          bottom_left_corner: Matrix.column_vector([0, 1.5*units]),
          bottom_right_corner: Matrix.column_vector([3*units, 3*units]),

          center_top: Matrix.column_vector([3.5*units, 1.25*units]),
          center_right: Matrix.column_vector([3.5*units, 1.75*units]),
          center_bottom: Matrix.column_vector([2.5*units, 1.75*units]),
          center_left: Matrix.column_vector([2.5*units, 1.25*units])
        }
      end
    end
  end
end
