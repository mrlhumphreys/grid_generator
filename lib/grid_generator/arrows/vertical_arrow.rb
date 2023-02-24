require_relative 'arrow'

module GridGenerator
  module Arrows
    class VerticalArrow < Arrow
      ARROW_WIDTH = 16
      ARROW_LENGTH = 8
      LINE_WIDTH = 6
    
      def arrow_start_point
        [
          [
            x,
            y+ARROW_LENGTH
          ],
          [
            x+(ARROW_WIDTH/2),
            y
          ],
          [
            x+ARROW_WIDTH,
            y+ARROW_LENGTH
          ]
        ]
      end
    
      def arrow_start_flat
        [
          [
            x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
            y
          ],
          [
            x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
            y
          ]
        ]
      end
    
      def arrow_start_side
        [
          [
            x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
            y+ARROW_LENGTH
          ],
          [
            x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
            y+ARROW_LENGTH+length
          ]
        ]
      end
    
      def arrow_end_point
        [
          [
            x+ARROW_WIDTH,
            y+ARROW_LENGTH+length
          ],
          [
            x+(ARROW_WIDTH/2),
            y+(ARROW_LENGTH*2)+length
          ],
          [
            x,
            y+ARROW_LENGTH+length
          ]
        ]
      end
    
      def arrow_end_flat
        [
          [
            x+(ARROW_WIDTH/2)+(LINE_WIDTH/2),
            y+(2*ARROW_LENGTH)+length
          ],
          [
            x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
            y+(2*ARROW_LENGTH)+length
          ]
        ]
      end
    
      def arrow_end_side
        [
          [
            x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
            y+ARROW_LENGTH+length
          ],
          [
            x+(ARROW_WIDTH/2)-(LINE_WIDTH/2),
            y+ARROW_LENGTH
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
