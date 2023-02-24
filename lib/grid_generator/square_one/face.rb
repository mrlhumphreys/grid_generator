require_relative '../base_line'
require_relative '../square_one_face_parser'
require_relative 'element_factory'

module GridGenerator
  module SquareOne
    class Face 
      def initialize(x:, y: , units: , elements:, axis_direction: :forward)
        @x, @y = x, y
        @units = units
        @elements = case elements 
        when String
          SquareOneFaceParser.new(elements).to_a
        when Array
          elements 
        else
          raise ArgumentError, "squares must be array or string" 
        end
        @axis_direction = axis_direction
      end
  
      attr_reader :x, :y, :units, :elements, :axis_direction
  
      def half_edge_width 
        @half_edge_width ||= half_face_size * Math.tan(Math::PI/12) 
      end
  
      def half_face_size 
        @half_face_size ||= face_size / 2 
      end
  
      def face_size
        @face_size ||= 3 * units
      end
  
      def axis
        if axis_direction == :back
          back_axis
        else
          forward_axis
        end
      end
  
      def forward_axis
        GridGenerator::BaseLine.new( 
          x1: x+half_face_size+half_edge_width,
          y1: y,
          x2: x+half_face_size-half_edge_width,
          y2: y+face_size
        ) 
      end
  
      def back_axis
        GridGenerator::BaseLine.new( 
          x1: x+half_face_size-half_edge_width,
          y1: y,
          x2: x+half_face_size+half_edge_width,
          y2: y+face_size
        ) 
      end
  
      def element_shapes
        elements.map do |element|
          GridGenerator::SquareOne::ElementFactory.new(
            x: x,
            y: y,
            units: units,
            shape: element[:shape],
            offset: element[:offset],
            colour: element[:colour],
            opacity: element[:opacity]
          ).build
        end
      end

      def as_json
        {
          "element_shapes" => element_shapes.map(&:as_json)
        }
      end
    end
  end
end
