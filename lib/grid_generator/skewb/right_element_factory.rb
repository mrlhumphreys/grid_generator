require_relative '../base_element'

module GridGenerator
  module Skewb
    class RightElementFactory
      def initialize(grid_x:, grid_y:, row_num:, col_num:, side_size:, units:, colour:, opacity:)
        @grid_x, @grid_y = grid_x, grid_y
        @row_num, @col_num = row_num, col_num
        @side_size, @units = side_size, units
        @colour, @opacity = colour, opacity
      end

      attr_reader :grid_x, :grid_y, :row_num, :col_num, :side_size, :units, :colour, :opacity

      def x
        @x ||= case [row_num, col_num]
        when [0, 0] # Right Front 
          grid_x 
        when [0, side_size] # Right Up 
          grid_x+(side_size-1)*2*units
        when [side_size, 0] # Right Down 
          grid_x
        when [side_size, side_size] # Right Right 
          grid_x+(side_size-1)*2*units
        when [(side_size/2),(side_size/2)] # Right Center
          grid_x
        else
          nil
        end
      end

      def y
        @y ||= case [row_num, col_num]
        when [0, 0] # Right Front 
          grid_y+(side_size-1)*units
        when [0, side_size] # Right Up 
          grid_y
        when [side_size, 0] # Right Down 
          grid_y+(2*side_size)*units
        when [side_size, side_size] # Right Right 
          grid_y+(side_size-1)*2*units
        when [(side_size/2),(side_size/2)] # Right Center
          grid_y+(side_size/2)*units
        else
          nil
        end
      end

      def points
        case [row_num, col_num]
        when [0, 0] # Right Front 
          [
            [ x, y+units ],
            [ x+2*units, y ],
            [ x, y+3*units ]
          ]
        when [0, side_size] # Right Up 
          [
            [ x, y+units ],
            [ x+2*units, y ],
            [ x+2*units, y+2*units ]
          ]
        when [side_size, 0] # Right Down 
          [
            [ x, y ],
            [ x+2*units, y+units ],
            [ x, y+2*units ]
          ]
        when [side_size, side_size] # Right Right 
          [
            [ x+2*units, y ],
            [ x+2*units, y+2*units ],
            [ x, y+3*units ]
          ]
        when [(side_size/2), (side_size/2)] # Right Center
          [
            [ x+2*units, y ],
            [ x+4*units, y+units ],
            [ x+2*units, y+4*units ],
            [ x, y+3*units ]
          ]
        else
          [] 
        end
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity) unless points.empty?
      end
    end
  end
end
