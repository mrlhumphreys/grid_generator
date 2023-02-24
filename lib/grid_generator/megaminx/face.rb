require_relative '../face_parser'
require_relative 'common'
require_relative 'element_factory'

module GridGenerator
  module Megaminx
    class Face
      include GridGenerator::Megaminx::Common
  
      def initialize(x:, y: , units: , elements: , rotation_offset: 0, label: nil)
        @x, @y = x, y
        @units = units
        @elements = FaceParser.new(elements).to_a
        @rotation_offset = rotation_offset
        @label = label
      end
  
      attr_reader :x, :y, :units, :elements, :rotation_offset, :label

      # outline
      
      def outline_string
        outer_corners.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end
  
      def inner_string
        inner_corners.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end
  
      def inline_string
        outer_edges_ordered_by_evens_then_odds.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end
  
      # elements 
      
      def element_shapes
        elements.each_with_index.map do |row, row_index|
          row.each_with_index.map do |element, element_index|
            GridGenerator::Megaminx::ElementFactory.new(
              x: x,
              y: y,
              row_index: row_index,
              element_index: element_index,
              units: units,
              colour: element[:colour],
              opacity: element[:opacity],
              rotation_offset: rotation_offset
            ).build if element
          end
        end.flatten.compact
      end

      # label methods
  
      def label_position
        x = rotation_point[0,0] - units*0.3
        y = rotation_point[1,0] + units*0.4
        {
          x: x.round, 
          y: y.round 
        }
      end
  
      def label_size
        units
      end

      def as_json
        {
          "outline_string" => outline_string,
          "inline_string" => inline_string,
          "element_shapes" => element_shapes.as_json,
          "label_position" => label_position,
          "label_size" => label_size
        }
      end
    end
  end
end
