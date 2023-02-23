module GridGenerator
  module Cubic
    class IsoView
      def initialize(x: , y: , units: , top_squares: , front_squares: , right_squares:)
        @x, @y = x, y
        @units = units
        top_x = x
        top_y = y
        @top = GridGenerator::Cubic::TopGrid.new(x: top_x, y: top_y, units: units, squares: top_squares) 
        front_x = x
        front_y = y + top.squares.size * units / 2 # y + (top.squares.size * units / 2)
        @front = GridGenerator::Cubic::FrontGrid.new(x: front_x, y: front_y, units: units, squares: front_squares) 

        right_x = x + top.squares.first.size * units 
        right_y = y + top.squares.first.size * units / 2
        @right = GridGenerator::Cubic::RightGrid.new(x: right_x, y: right_y, units: units, squares: right_squares) 
      end
  
      attr_reader :x, :y, :units, :top, :front, :right

      def as_json
        {
          "top" => top.as_json,
          "front" => front.as_json,
          "right" => right.as_json
        }
      end
    end
  end
end
