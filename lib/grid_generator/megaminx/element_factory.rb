require_relative '../base_element'
require_relative 'common'

module GridGenerator
  module Megaminx
    class ElementFactory
      include GridGenerator::Megaminx::Common

      CENTER_INDEX = 0
      EDGE_INDEX = 1
      CORNER_INDEX = 2

      def initialize(x: , y:, row_index:, element_index:, units:, colour:, opacity:, rotation_offset: 0) 
        @x, @y = x, y
        @row_index = row_index
        @element_index = element_index
        @units = units
        @colour = colour
        @opacity = opacity
        @rotation_offset = rotation_offset
      end

      attr_reader :x, :y, :row_index, :element_index, :units, :colour, :opacity, :rotation_offset

      def points
        case row_index
        when CENTER_INDEX
          inner_corners  
        when EDGE_INDEX
          [
            outer_edges[element_index], 
            inner_corners[(element_index+1) % 5], 
            inner_corners[element_index], 
          ]
        when CORNER_INDEX
          [
            outer_corners[element_index], 
            outer_edges[element_index], 
            inner_corners[element_index], 
            outer_edges[(element_index-1) % 5], 
          ]
        else
          raise ArgumentError, "unknown row #{row_index}"
        end
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
