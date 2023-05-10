require_relative './element_factory'

module GridGenerator
  module CurvyCopter 
    class RightElementFactory < ElementFactory
      def anchors
        @anchors ||= {
          top_left_corner: Matrix.column_vector([0, 1.5*units]),
          top_right_corner: Matrix.column_vector([3*units, 0*units]),
          bottom_left_corner: Matrix.column_vector([0, 4.5*units]),
          bottom_right_corner: Matrix.column_vector([3*units, 3*units]),

          top_edge_left: Matrix.column_vector([units, units]),
          top_edge_right: Matrix.column_vector([2*units, 0.5*units]),
          right_edge_top: Matrix.column_vector([3*units, units]),
          right_edge_bottom: Matrix.column_vector([3*units, 2*units]),
          bottom_edge_left: Matrix.column_vector([units, 4*units]),
          bottom_edge_right: Matrix.column_vector([2*units, 3.5*units]),
          left_edge_top: Matrix.column_vector([0, 2.5*units]),
          left_edge_bottom: Matrix.column_vector([0, 3.5*units]),

          center: Matrix.column_vector([1.5*units, 2.25*units]), 

          top_edge_center: Matrix.column_vector([1.5*units, 1.5*units]), 
          right_edge_center: Matrix.column_vector([2.25*units, 1.875*units ]), 
          bottom_edge_center: Matrix.column_vector([1.5*units, 3*units ]), 
          left_edge_center: Matrix.column_vector([0.75*units, 2.625*units]), 

          top_left_corner_center: Matrix.column_vector([0.75*units, 1.875*units]), 
          top_right_corner_center: Matrix.column_vector([2.25*units, 1.125*units]), 
          bottom_left_corner_center: Matrix.column_vector([0.75*units, 3.375*units ]), 
          bottom_right_corner_center: Matrix.column_vector([2.25*units, 2.625*units]) 
        }
      end
    end
  end
end
