require_relative './element_factory'

module GridGenerator
  module Skewb
    class LeftElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner: Matrix.column_vector([0, 0]),
          top_right_corner: Matrix.column_vector([4*units, 2*units]),
          bottom_left_corner: Matrix.column_vector([0, 4*units]),
          bottom_right_corner: Matrix.column_vector([4*units, 6*units]),

          top_middle: Matrix.column_vector([2*units, units]),
          left_middle: Matrix.column_vector([0, 2*units]),
          right_middle: Matrix.column_vector([4*units, 4*units]),
          bottom_middle: Matrix.column_vector([2*units, 5*units])
        }
      end
    end
  end
end
