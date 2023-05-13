require_relative './element_factory'

module GridGenerator
  module Skewb
    class TopElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner: Matrix.column_vector([4*units, 0]),
          top_right_corner: Matrix.column_vector([8*units, 2*units]),
          bottom_left_corner: Matrix.column_vector([0, 2*units]),
          bottom_right_corner: Matrix.column_vector([4*units, 4*units]),

          top_middle: Matrix.column_vector([6*units, units]),
          left_middle: Matrix.column_vector([2*units, units]),
          right_middle: Matrix.column_vector([6*units, 3*units]),
          bottom_middle: Matrix.column_vector([2*units, 3*units])
        }
      end
    end
  end
end
