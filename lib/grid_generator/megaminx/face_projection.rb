require 'matrix'
require_relative '../rotator'
require_relative '../helper'

module GridGenerator
  module Megaminx
    class FaceProjection
      # units 30 - pentagon 90 - megaminx - 150
      # units * 5 
      #       *****
      #        *** 
      #        ***
      #        
      #  ***   ***   ***
      #  ***   ***   ***
      # ***** ***** *****
      #
      #    ***** *****
      #     ***   ***
      #     ***   ***
      def initialize(x:, y:, units:, elements: [])
        @x, @y = x, y
        @units = units
        @elements = elements
      end

      attr_reader :x, :y, :units, :elements

      def offset
        @offset ||= Matrix.column_vector([x, y])
      end

      def decagon_radius
        5 * units
      end

      def decagon_top_point
        Matrix.column_vector([
          0,
          decagon_radius
        ])
      end

      def rotation_point
        Matrix.column_vector([
          decagon_radius,
          decagon_radius
        ])
      end

      def decagon_points
        @decagon_points ||= (0..9).map do |i|
          angle = 2.0 * Math::PI * i / 10.0
          rotator = GridGenerator::Rotator.new(angle: angle, rotation_point: rotation_point)    
          rotator.rotate(top_point)
        end
      end

      # also equal to pentagon radius
      def decagon_side_length 
        @decagon_side_length ||= GridGenerator::Helper.distance(decagon_points[0], decagon_points[1])
      end

      def pentagon_top_point
        @pentagon_top_point ||= Matrix.column_vector([
          decagon_radius,
          decagon_radius - decagon_side_length 
        ])
      end

      def pentagon_points 
        @pentagon_points ||= (0..4).map do |i|
          angle = 2.0 * Math::PI * i / 5.0
          rotator = GridGenerator::Rotator.new(angle: angle, rotation_point: rotation_point)    
          rotator.rotate(top_point)
        end
      end

      # for svg 
      def connecting_lines
        @connecting_lines ||= pentagon_points.map_with_index do |p, i|
          d = decagon_point[i*2]
          offset_p = p + offset
          offset_d = d + offset
          GridGenerator::BaseLine.new(
            x1: offset_p[0,0],
            y1: offset_p[1,0],
            x2: offset_d[0,0],
            y2: offset_p[1,0]
          )
        end
      end

      # for svg
      def decagon_points_string
        decagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end

      # for svg
      def pentagon_points_string
        pentagon_points.map { |p| p + offset }.map { |p| "#{p[0,0].round},#{p[1,0].round}" }.join(' ')
      end
    end
  end
end

