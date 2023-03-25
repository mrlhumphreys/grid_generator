require_relative '../line'
require_relative '../base_element'
require_relative 'skewb_grid'
require_relative 'top_element_factory'

module GridGenerator
  module Skewb
    class TopSkewbGrid < Skewb::SkewbGrid
      COLOURS = {
        fill: "#d0d0d0",
        stroke: "#404040"
      }

      def factory_class
        GridGenerator::Skewb::TopElementFactory
      end
  
      def border_points
        [
          [ x + side_size*2*units, y ],
          [ x + side_size*4*units, y + side_size*units ],
          [ x + side_size*2*units, y + side_size*2*units ],
          [ x, y + side_size*units ]
        ]
      end 
  
      def rows
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + 2*units,
            y + (2*i+1)*units,
          ])

          b = Matrix.column_vector([
            x + 6*units,
            y + (2*i+1)*units
          ])

          GridGenerator::Line.new(a: a, b: b) 
        end
      end
  
      def columns
        Array.new(side_size) do |i|
          a = Matrix.column_vector([
            x + (4*i+2)*units,
            y + units,
          ])

          b = Matrix.column_vector([
            x + (4*i+2)*units,
            y + 3*units
          ])

          GridGenerator::Line.new(a: a, b: b) 
        end
      end

      def to_svg
        output = "<polygon points=\"#{border_points_string}\" style=\"fill:#{COLOURS[:fill]};stroke:#{COLOURS[:stroke]};stroke-width:1\" />"

        rows.each do |row|
          output += "<line x1=\"#{row.x1}\" y1=\"#{row.y1}\" x2=\"#{row.x2}\" y2=\"#{row.y2}\" style=\"stroke:#{COLOURS[:stroke]};stroke-width:1\" />"
        end

        columns.each do |col|
          output += "<line x1=\"#{col.x1}\" y1=\"#{col.y1}\" x2=\"#{col.x2}\" y2=\"#{col.y2}\" style=\"stroke:#{COLOURS[:stroke]};stroke-width:1\" />"
        end

        element_shapes.each do |element|
          if element
            output += "<polygon points=\"#{element.points_string}\" style=\"fill:#{element.colour};stroke:#{COLOURS[:stroke]};stroke-width:1;opacity:#{element.opacity}\" />"
          end
        end

        output
      end
    end
  end
end
