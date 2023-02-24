require_relative 'triangle_factory'

module GridGenerator
  module Pyraminx
    class Grid 
      def initialize(x: ,y:, size: ,units: ,elements:)
        @x, @y = x, y
        @size = size
        @units = units
        @elements = elements
      end
    
      attr_reader :x, :y, :size, :units, :elements
    
      def shape_points
        [
          [ x+size*units, y ],
          [ x+2*size*units, y+size*units ],
          [ x+size*units, y+2*size*units ],
          [ x, y+size*units ]
        ]
      end
    
      def shape_points_string
        shape_points.map { |x,y| [x,y].join(',') }.join(' ')
      end
    
      def vertical_line_points
        Array.new((2*size)-1) do |i|
          { 
            "x1" => x+((i+1)-size).abs*units, 
            "y1" => y+(i+1)*units,  
            "x2" => x+((((i+1)-size).abs*-1)+2*size)*units,
            "y2" => y+(i+1)*units 
          }
        end
      end
    
      def diagonal_down_line_points
        Array.new(size-1) do |i|
          {
            "x1" => x+((i-1).abs + 1)*units,
            "y1" => y+(i+1)*units,
            "x2" => x+((i-1).abs + 1 + size)*units,
            "y2" => y+(i+1+size)*units
          }
        end
      end
    
      def diagonal_up_line_points
        Array.new(size-1) do |i|
          {
            "x1" => x+(i+1)*units,
            "y1" => y+(i+1+size)*units,
            "x2" => x+(i+1+size)*units,
            "y2" => y+(i+1)*units
          }
        end
      end
    
      def element_shapes
        elements.map do |row|
          row.map do |element|
            if element 
              GridGenerator::Pyraminx::TriangleFactory.new(x: x, y: y, units: units, direction: element[:direction], colour: element[:colour], opacity: element[:opacity]).build
            else
              nil
            end
          end
        end.flatten.compact
      end

      def as_json
        {
          "vertical_line_points" => vertical_line_points,
          "diagonal_down_line_points" => diagonal_down_line_points,
          "diagonal_up_line_points" => diagonal_up_line_points,
          "element_shapes" => element_shapes.map(&:as_json)
        }
      end
    end
  end
end
