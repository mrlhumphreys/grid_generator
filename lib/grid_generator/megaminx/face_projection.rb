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
          decagon_radius,
          0 
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
          rotator.rotate(decagon_top_point)
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
          rotator.rotate(pentagon_top_point)
        end
      end

      def top_right_pentagon_points
        @top_right_pentagon_points ||= [
          decagon_points[0],
          decagon_points[1],
          decagon_points[2],
          pentagon_points[1],
          pentagon_points[0]
        ]
      end

      # for svg 
      def connecting_lines
        pentagon_points.each_with_index.map do |p, i|
          d = decagon_points[i*2]
          offset_p = p + offset
          offset_d = d + offset
          GridGenerator::BaseLine.new(
            x1: offset_p[0,0],
            y1: offset_p[1,0],
            x2: offset_d[0,0],
            y2: offset_d[1,0]
          )
        end
      end
      
      # for svg
      def top_right_face_lines
        (0..4).map do |i| 
          a = top_right_pentagon_points[i]
          b = top_right_pentagon_points[(i+1)%5]
          c = top_right_pentagon_points[(i+2)%5]
          d = top_right_pentagon_points[(i+3)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          line_start = ab_intervals.last + offset
          line_end = cd_intervals.first + offset

          GridGenerator::BaseLine.new(
            x1: line_start[0,0],
            y1: line_start[1,0],
            x2: line_end[0,0],
            y2: line_end[1,0]
          )
        end
      end

      # for svg
      def front_face_lines
        (0..4).map do |i| 
          a = pentagon_points[i]
          b = pentagon_points[(i+1)%5]
          c = pentagon_points[(i+2)%5]
          d = pentagon_points[(i+3)%5]

          ab_intervals = GridGenerator::Helper.intervals(a,b,2)
          cd_intervals = GridGenerator::Helper.intervals(c,d,2)

          line_start = ab_intervals.last + offset
          line_end = cd_intervals.first + offset

          GridGenerator::BaseLine.new(
            x1: line_start[0,0],
            y1: line_start[1,0],
            x2: line_end[0,0],
            y2: line_end[1,0]
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

