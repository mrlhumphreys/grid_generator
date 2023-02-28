require_relative 'arrow'

module GridGenerator
  module Arrows
    class DiagonalUpArrow < Arrow
      ARROW_SIDE = 12
      ARROW_OVERHANG = 4 
    
      def arrow_start_point
        [
          [ x+ARROW_SIDE, y+length+ARROW_SIDE ],
          [ x, y+length+ARROW_SIDE ],
          [ x, y+length ]
        ]
      end
    
      def arrow_start_flat
        [
          [ x+ARROW_SIDE-(2*ARROW_OVERHANG), y+length+ARROW_SIDE ],
          [ x, y+length+(2*ARROW_OVERHANG) ]
        ]
      end
    
      def arrow_start_side
        [
          [ x+ARROW_OVERHANG, y+length+ARROW_OVERHANG ],
          [ x+length+ARROW_OVERHANG, y+ARROW_OVERHANG ]
        ]
      end
    
      def arrow_end_point
        [
          [ x+length, y ],
          [ x+length+ARROW_SIDE, y ],
          [ x+length+ARROW_SIDE, y+ARROW_SIDE ]
        ]
      end
    
      def arrow_end_flat
        [
          [ x+length+(2*ARROW_OVERHANG), y ],
          [ x+length+ARROW_SIDE, y+ARROW_SIDE-(2*ARROW_OVERHANG) ]
        ]
      end
    
      def arrow_end_side
        [
          [ x+length+ARROW_SIDE-ARROW_OVERHANG, y+ARROW_SIDE-ARROW_OVERHANG ],
          [ x+ARROW_SIDE-ARROW_OVERHANG, y+length+ARROW_SIDE-ARROW_OVERHANG ]
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
