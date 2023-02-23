require './lib/grid_generator/arrows/arrow.rb'

module GridGenerator
  module Arrows
    class DiagonalDownArrow < Arrow
      ARROW_SIDE = 12
      ARROW_OVERHANG = 4 
    
      def arrow_start_point
        [
          [
            x,
            y+ARROW_SIDE
          ],
          [
            x,
            y
          ],
          [
            x+ARROW_SIDE,
            y
          ]
        ]
      end
    
      def arrow_start_flat
        [
          [
            x,
            y+ARROW_SIDE-(2*ARROW_OVERHANG)
          ],
          [
            x+ARROW_SIDE-(2*ARROW_OVERHANG),
            y
          ]
        ]
      end
    
      def arrow_start_side
        [
          [
            x+ARROW_SIDE-ARROW_OVERHANG,
            y+ARROW_OVERHANG
          ],
          [
            x+(ARROW_SIDE-ARROW_OVERHANG)+length,
            y+length+ARROW_OVERHANG
          ]
        ]
      end
    
      def arrow_end_point
        [
          [
            x+ARROW_SIDE+length,
            y+length
          ],
          [
            x+ARROW_SIDE+length,
            y+ARROW_SIDE+length
          ],
          [
            x+length,
            y+ARROW_SIDE+length
          ]
        ]
      end
    
      def arrow_end_flat
        [
          [
            x+ARROW_SIDE+length,
            y+length+(2*ARROW_OVERHANG)
          ],
          [
            x+length+(2*ARROW_OVERHANG),
            y+ARROW_SIDE+length
          ]
        ]
      end
    
      def arrow_end_side
        [
          [
            x+length+ARROW_OVERHANG,
            y+ARROW_SIDE+length-ARROW_OVERHANG
          ],
          [
            x+ARROW_OVERHANG,
            y+ARROW_SIDE-ARROW_OVERHANG
          ]
        ]
      end
    
      def points
        case direction
        when :forward
          arrow_start_flat + arrow_start_side + arrow_end_point + arrow_end_side
        when :backward
          arrow_start_point + arrow_start_side + arrow_end_flat + arrow_end_side
        else
          arrow_start_point + arrow_start_side + arrow_end_point + arrow_end_side
        end
      end
    end
  end
end
