module GridGenerator
  module Skewb
    class LeftElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, side_size:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @side_size, @units = side_size, units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :side_size, :units, :colour, :opacity

      def x
        @x ||= case [row_num, col_num]
        when [0, 0] # Left Up 
          grid_x 
        when [0, side_size] # Left Front 
          grid_x+(side_size-1)*2*units
        when [side_size, 0] # Left Left
          grid_x
        when [side_size, side_size] # Left Down 
          grid_x+(side_size-1)*2*units
        when [(side_size/2),(side_size/2)] # Left Center
          grid_x
        else
          nil
        end
      end

      def y
        @y ||= case [row_num, col_num]
        when [0, 0] # Left Up 
          grid_y
        when [0, side_size] # Left Front 
          grid_y+(side_size-1)*units
        when [side_size, 0] # Left Left
          grid_y+(side_size-1)*2*units
        when [side_size, side_size] # Left Down 
          grid_y+(side_size)*2*units
        when [(side_size/2),(side_size/2)] # Left Center
          grid_y+(side_size/2)*units
        else
          nil
        end
      end

      def points
        case [row_num, col_num]
        when [0, 0] # Left Up 
          [
            [ x, y ],
            [ x+2*units, y+units ],
            [ x, y+2*units ]
          ]
        when [0, side_size] # Left Front 
          [
            [ x, y ],
            [ x+2*units, y+units ],
            [ x+2*units, y+3*units ]
          ]
        when [side_size, 0] # Left Left
          [
            [ x, y ],
            [ x+2*units, y+3*units ],
            [ x, y+2*units ]
          ]
        when [side_size, side_size] # Left Down 
          [
            [ x+2*units, y ],
            [ x+2*units, y+2*units ],
            [ x, y+units ]
          ]
        when [(side_size/2), (side_size/2)] # Left Center
          [
            [ x+2*units, y ],
            [ x+4*units, y+3*units ],
            [ x+2*units, y+4*units ],
            [ x, y+units ]
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
