require_relative 'arrow'

module GridGenerator
  module Arrows
    class HorizontalArrow < Arrow
      ARROW_WIDTH = 16
      ARROW_LENGTH = 8
      LINE_WIDTH = 6
    
      def arrow_start_point
        [
          [
            x+ARROW_LENGTH,
            y+ARROW_WIDTH
          ],
          [
            x,
            y+(ARROW_WIDTH/2)
          ],
          [
            x+ARROW_LENGTH,
            y
          ]
        ]
      end
    
      def arrow_start_flat
        [
          [
            x,
            y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
          ],
          [
            x,
            y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
          ]
        ]
      end
    
      def arrow_start_side
        [
          [
            x+ARROW_LENGTH,
            y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
          ],
          [
            x+ARROW_LENGTH+length,
            y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
          ]
        ]
      end
    
      def arrow_end_point
        [
          [
            x+ARROW_LENGTH+length,
            y
          ],
          [
            x+(2*ARROW_LENGTH)+length,
            y+(ARROW_WIDTH/2)
          ],
          [
            x+ARROW_LENGTH+length,
            y+ARROW_WIDTH
          ]
        ]
      end
    
      def arrow_end_flat
        [
          [
            x+(2*ARROW_LENGTH)+length,
            y+(ARROW_WIDTH/2)-(LINE_WIDTH/2)
          ],
          [
            x+(2*ARROW_LENGTH)+length,
            y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
          ]
        ]
      end
    
      def arrow_end_side
        [
          [
            x+ARROW_LENGTH+length,
            y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
          ],
          [
            x+ARROW_LENGTH,
            y+(ARROW_WIDTH/2)+(LINE_WIDTH/2)
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
