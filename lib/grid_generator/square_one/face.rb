require_relative '../line'
require_relative '../square_one_face_parser'
require_relative 'element_factory'

module GridGenerator
  module SquareOne
    class Face 
      COLOURS = {
        fill: "#d0d0d0",
        stroke: "#404040"
      }

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
        a = Matrix.column_vector([
          x+half_face_size+half_edge_width,
          y,
        ])

        b = Matrix.column_vector([
          x+half_face_size-half_edge_width,
          y+face_size
        ])

        GridGenerator::Line.new(a: a, b: b) 
      end
  
      def back_axis
        a = Matrix.column_vector([
          x+half_face_size-half_edge_width,
          y,
        ])

        b = Matrix.column_vector([
          x+half_face_size+half_edge_width,
          y+face_size
        ])

        GridGenerator::Line.new(a: a, b: b) 
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

      def to_svg
        output = ""
        element_shapes.each do |element|
          if element.opacity == 0.4
            output += "<polygon points=\"#{ element.points_string }\" style=\"fill:#{ COLOURS[:fill] };stroke:#{ COLOURS[:stroke] };stroke-width:1;opacity:1;\" />"
          end
          output += "<polygon points=\"#{ element.points_string }\" style=\"fill:#{ element.colour };stroke:#{ COLOURS[:stroke] };stroke-width:1;opacity:#{ element.opacity };\" />"
         end

        output += "<line x1=\"#{ axis.x1 }\" y1=\"#{ axis.y1 }\" x2=\"#{ axis.x2 }\" y2=\"#{ axis.y2 }\" style=\"stroke:#{ COLOURS[:stroke] };stroke-width:5\" />"

        output
      end
    end
  end
end
