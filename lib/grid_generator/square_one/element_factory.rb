require 'matrix'
require_relative '../base_element'

module GridGenerator
  module SquareOne
    class ElementFactory
      def initialize(x: , y:, units:, shape:, offset:, colour:, opacity:)
        @x, @y = x, y
        @units = units
        @shape = shape
        @offset = offset
        @colour = colour
        @opacity = opacity
      end

      attr_reader :x, :y, :units, :shape, :offset, :colour, :opacity

      def base_points
        case shape
        when :edge
          [
            Matrix.column_vector([x+half_face_size-half_edge_width, y]),
            Matrix.column_vector([x+half_face_size+half_edge_width, y]),
            Matrix.column_vector([x+half_face_size, y+half_face_size])
          ]
        when :corner
          [
            Matrix.column_vector([x+half_face_size+half_edge_width, y]),
            Matrix.column_vector([x+face_size, y]),
            Matrix.column_vector([x+face_size, y+half_face_size-half_edge_width]),
            Matrix.column_vector([x+half_face_size, y+half_face_size])
          ] 
        when :middle
          [
            Matrix.column_vector([x+half_face_size+half_edge_width, y]),
            Matrix.column_vector([x+face_size, y]),
            Matrix.column_vector([x+face_size, y+face_size]),
            Matrix.column_vector([x+half_face_size-half_edge_width, y+face_size])
          ] 
        when :middle_flipped
          @base_points ||= [
            Matrix.column_vector([x+half_face_size-half_edge_width, y]),
            Matrix.column_vector([x+face_size, y]),
            Matrix.column_vector([x+face_size, y+face_size]),
            Matrix.column_vector([x+half_face_size+half_edge_width, y+face_size])
          ] 
        else
          raise ArgumentError, "unknown face shape: #{edge}"
        end
      end

      def offset_radians
        offset*Math::PI/6
      end

      def half_edge_width 
        @half_edge_width ||= half_face_size * Math.tan(Math::PI/12) 
      end

      def half_face_size 
        @half_face_size ||= face_size / 2 
      end

      def face_size
        @face_size ||= 3 * units
      end

      def rotation_point
        Matrix.column_vector([x+half_face_size, y+half_face_size])
      end

      def rotation_matrix
        @rotation_matrix ||= Matrix[
          [Math.cos(offset_radians), -1*Math.sin(offset_radians)], 
          [Math.sin(offset_radians), Math.cos(offset_radians)]
        ]
      end
  

      def points
        base_points.map { |p| (rotation_matrix * (p - rotation_point)) + rotation_point }
      end

      def build
        GridGenerator::BaseElement.new(points: points, colour: colour, opacity: opacity)
      end
    end
  end
end
