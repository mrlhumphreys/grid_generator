require 'matrix'

module GridGenerator
  module Megaminx
    module Common
      ROTATION_STEP = 2 * Math::PI / 5

      ROTATION_MATRIX = Proc.new do |theta|
        Matrix[
          [Math.cos(theta), -1*Math.sin(theta)], 
          [Math.sin(theta), Math.cos(theta)]
        ]
      end

      ROTATION_MATRICES = Array.new(5) do |i|
        ROTATION_MATRIX.call(ROTATION_STEP * i)
      end

      def rotation_offset_matrix 
        @rotation_offset_matrix ||= ROTATION_MATRIX.call(rotation_offset)
      end

      def rotation_point
        @rotation_point ||= Matrix.column_vector([x+2*units, y+2*units])
      end

      def rotate(matrix, point)
        (matrix * (point - rotation_point)) + rotation_point
      end

      # line
  
      def intersection(a,b,c,d)
        x1 = a[0,0]
        y1 = a[1,0] 
        x2 = b[0,0]
        y2 = b[1,0]
        x3 = c[0,0]
        y3 = c[1,0]
        x4 = d[0,0]
        y4 = d[1,0] 
  
        px_numerator = (x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)
        px_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4) 
  
        py_numerator = (x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)
        py_denominator = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  
        px = px_numerator / px_denominator
        py = py_numerator / py_denominator
  
        Matrix.column_vector([px, py])
      end

      # points
      
      def top_outer_corner
        @top_outer_corner ||= rotate(rotation_offset_matrix, Matrix.column_vector([x+2*units,y]))
      end

      def top_outer_edge
        point_a, point_b = outer_corners.first(2)
        @top_outer_edge = (point_a + point_b) / 2 
      end

      def top_inner_corner
        intersection(outer_edges[4], outer_edges[1], outer_edges[3], outer_edges[0])
      end

      def outer_corners
        @outer_corners ||= ROTATION_MATRICES.map do |matrix|
          rotate(matrix, top_outer_corner)
        end
      end

      def outer_edges
        @outer_edges ||= ROTATION_MATRICES.map do |matrix|
          rotate(matrix, top_outer_edge)
        end
      end

      def inner_corners
        @inner_corners ||= ROTATION_MATRICES.map do |matrix|
          rotate(matrix, top_inner_corner)
        end
      end

      def outer_edges_ordered_by_evens_then_odds
        evens = outer_edges.select.with_index { |_,i| i % 2 == 0 } 
        odds = outer_edges.select.with_index { |_,i| i % 2 == 1 } 
        evens + odds
      end
    end
  end
end
