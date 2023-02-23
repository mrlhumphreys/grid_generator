module GridGenerator
  module Skewb
    class TopElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, side_size:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @side_size, @units = side_size, units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :side_size, :units, :colour, :opacity

      def x
        @x ||= case [row_num, col_num]
        when [0, 0] # Top Back 
          grid_x+(side_size-1)*2*units 
        when [0, side_size] # Top Right
          grid_x+((side_size*2)-1)*2*units
        when [side_size, 0] # Top Left
          grid_x
        when [side_size, side_size] # Top Front
          grid_x+(side_size-1)*2*units
        when [(side_size/2),(side_size/2)] # Top Center
          grid_x+(side_size/2)*2*units
        else
          nil
        end
      end

      def y
        @y ||= case [row_num, col_num]
        when [0, 0] # Top Back 
          grid_y
        when [0, side_size] # Top Right 
          grid_y+(side_size-1)*units
        when [side_size, 0] # Top Left
          grid_y+(side_size-1)*units
        when [side_size, side_size] # Top Front
          grid_y+(side_size*2-1)*units
        when [(side_size/2),(side_size/2)] # Top Center
          grid_y+(side_size/2)*units
        else
          nil
        end
      end

      def points
        case [row_num, col_num]
        when [0, 0] # Top Back
          [
            [ x+2*units, y ],
            [ x+4*units, y+units ],
            [ x, y+units ]
          ]
        when [0, side_size] # Top Right 
          [
            [ x, y ],
            [ x+2*units, y+units ],
            [ x, y+2*units ]
          ]
        when [side_size, 0] # Top Left
          [
            [ x+2*units, y ],
            [ x+2*units, y+2*units ],
            [ x, y+units ]
          ]
        when [side_size, side_size] # Top Front
          [
            [ x, y ],
            [ x+4*units, y ],
            [ x+2*units, y+units ]
          ]
        when [(side_size/2), (side_size/2)] # Top Center
          [
            [ x, y ],
            [ x+4*units, y ],
            [ x+4*units, y+2*units ],
            [ x, y+2*units ]
          ]
        else
          nil
        end
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
