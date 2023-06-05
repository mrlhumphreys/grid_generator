require_relative './element_factory'

module GridGenerator
  module RediCube 
    class LeftElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner_top_left: Matrix.column_vector([0, 0]),
          top_left_corner_top_right: Matrix.column_vector([units, 0.5*units]),
          top_left_corner_bottom_left: Matrix.column_vector([0, units]),
          top_left_corner_bottom_right: Matrix.column_vector([units, 1.5*units]),

          top_right_corner_top_left: Matrix.column_vector([2*units, units]),
          top_right_corner_top_right: Matrix.column_vector([3*units, 1.5*units]),
          top_right_corner_bottom_left: Matrix.column_vector([2*units, 2*units]),
          top_right_corner_bottom_right: Matrix.column_vector([3*units, 2.5*units]),

          bottom_left_corner_top_left: Matrix.column_vector([0, 2*units]),
          bottom_left_corner_top_right: Matrix.column_vector([units, 2.5*units]),
          bottom_left_corner_bottom_left: Matrix.column_vector([0, 3*units]),
          bottom_left_corner_bottom_right: Matrix.column_vector([units, 3.5*units]),

          bottom_right_corner_top_left: Matrix.column_vector([2*units, 3*units]),
          bottom_right_corner_top_right: Matrix.column_vector([3*units, 3.5*units]),
          bottom_right_corner_bottom_left: Matrix.column_vector([2*units, 4*units]),
          bottom_right_corner_bottom_right: Matrix.column_vector([3*units, 4.5*units]),

          center: Matrix.column_vector([1.5*units, 2.25*units])
        }
      end
    end
  end
end
